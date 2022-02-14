#!/usr/bin/env nix-shell
#!nix-shell update-shell.nix -i bash

set -eEuo pipefail

current_command='none'
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'code=$?; if [ "$code" -ne "0" ]; then echo "\"${last_command}\" command ended with exit code $code."; fi' EXIT

script_dir="$(dirname "$(realpath "$0")")"
plugins="${script_dir}/plugins.yaml"
nix_new_file="${script_dir}/plugins_new.nix"
nix_file="${script_dir}/plugins.nix"

github_auth="$(cat "${script_dir}/github.auth")"

if [ -z "$github_auth" ]; then
  echo "Please supply GitHub API credentials"
  exit 1
fi

plugins_json="$(dasel -r yaml -w json . <"$plugins")"
readarray -t plugin_array <<<"$(echo "$plugins_json" | jq -c '.[]')"

rm -f "$nix_new_file"
echo '# This file has been auto-generated' >"$nix_new_file"
echo '{ pkgs, ... }:' >>"$nix_new_file"

echo "{" >>"$nix_new_file"
for plugin in "${plugin_array[@]}"; do
  raw_src="$(echo "$plugin" | dasel -r json --plain '.src')"
  owner="$(echo "$raw_src" | cut -d'/' -f1)"
  repo="$(echo "$raw_src" | cut -d'/' -f2)"

  echo "Updating ${owner}/${repo} ..."

  branch="$(echo "$plugin" | jq -r '.branch // empty')"
  name="$(echo "$repo" | tr [.] '-')"

  if [ -z "$branch" ]; then
    src="$(nix-prefetch-github --nix --fetch-submodules "$owner" "$repo" 2>/dev/null | tail -n +4)"
  else
    src="$(nix-prefetch-github --nix --fetch-submodules --rev "$branch" "$owner" "$repo" 2>/dev/null | tail -n +4)"
  fi

  rev="$(echo "$src" | grep rev | cut -d '"' -f 2)"
  commit_info="$(curl -u "$github_auth" --silent "https://api.github.com/repos/${owner}/${repo}/commits/${rev}")"
  commit_date="$(echo "$commit_info" | dasel -r json --plain '.commit.committer.date')"

  if [[ "$commit_date" == "null" ]]; then
    commit_date="$(echo "$commit_info" | dasel -r json --plain '.commit.author.date')"
  fi

  version="$(date -d "$commit_date" "+%s")"

  echo "${name} = pkgs.vimUtils.buildVimPluginFrom2Nix {" >>"$nix_new_file"
  echo "pname = \"${repo}\";" >>"$nix_new_file"
  echo "version = \"${version}\";" >>"$nix_new_file"
  echo "src = ${src};" >>"$nix_new_file"

  build_inputs="$(echo "$plugin" | jq -r '.nativeBuildInputs // empty' | jq -r @sh)"
  if [ -n "$build_inputs" ]; then
    echo -n "nativeBuildInputs = with pkgs; [" >>"$nix_new_file"
    echo -n "$build_inputs" | tr -d "'" >>"$nix_new_file"
    echo '];' >>"$nix_new_file"
  fi

  build_phase="$(echo "$plugin" | jq -r '.buildPhase // empty')"
  if [ -n "$build_phase" ]; then
    printf "buildPhase = ''\n%s\n'';\n" "$build_phase" >>"$nix_new_file"
  fi

  echo "meta.homepage = \"https://github.com/${owner}/${repo}\";" >>"$nix_new_file"
  echo '};' >>"$nix_new_file"
done
echo "}" >>"$nix_new_file"

nixpkgs-fmt "$nix_new_file"

if test -f "$nix_file"; then
  set +eo pipefail
  diff -U 2 "$nix_file" "$nix_new_file" | bat --paging=never -ldiff
  set -eo pipefail

  mv "$nix_new_file" "$nix_file"
else
  mv "$nix_new_file" "$nix_file"

  set +eo pipefail
  bat --paging=never "$nix_file"
  set -eo pipefail
fi
