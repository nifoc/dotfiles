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

plugins_json="$(dasel -r yaml -w json . <"$plugins")"
readarray -t plugin_array <<<"$(echo "$plugins_json" | jq -c '.[]')"

rm -f "$nix_new_file"
echo '# This file has been auto-generated' >"$nix_new_file"
echo '{ pkgs, ... }:' >>"$nix_new_file"

echo "{" >>"$nix_new_file"
for plugin in "${plugin_array[@]}"; do
  raw_src="$(echo "$plugin" | dasel -r json --plain '.src')"
  owner="$(echo "$raw_src" | awk -F'/' '{ print $(NF-1) }')"
  repo="$(echo "$raw_src" | awk -F'/' '{ print $(NF) }')"

  echo "Updating ${owner}/${repo} ..."

  if [[ "$raw_src" = http* ]]; then
    clone_src="$raw_src"
  else
    clone_src="https://github.com/${owner}/${repo}.git"
  fi

  branch="$(echo "$plugin" | jq -r '.branch // empty')"
  name="$(echo "$repo" | tr [.] '-')"
  fetch_submodules="$(echo "$plugin" | jq -r '.fetchSubmodules // empty')"

  if [ "$fetch_submodules" == "true" ]; then
    nix_submodules="--fetch-submodules"
  else
    nix_submodules=""
  fi

  if [ -z "$branch" ]; then
    src_json="$(nix-prefetch-git --quiet $nix_submodules "$clone_src")"
  else
    src_json="$(nix-prefetch-git --quiet $nix_submodules --rev "$branch" "$clone_src")"
  fi

  src="{
    owner = \"${owner}\";
    repo = \"${repo}\";
    rev = \"$(echo "$src_json" | dasel -r json --plain '.rev')\";
    sha256 = \"$(echo "$src_json" | dasel -r json --plain '.sha256')\";
    fetchSubmodules = $(echo "$src_json" | dasel -r json --plain '.fetchSubmodules');
  }"

  commit_date="$(echo "$src_json" | dasel -r json --plain '.date')"
  version="$(date -d "$commit_date" "+%Y-%m-%d")"

  case "$clone_src" in
  https://github.com*)
    fetcher="pkgs.fetchFromGitHub"
    ;;
  https://git.sr.ht*)
    fetcher="pkgs.fetchFromSourcehut"
    ;;
  *)
    echo "Unsupported URL: $clone_src"
    exit 1
    ;;
  esac

  {
    echo "${name} = pkgs.vimUtils.buildVimPluginFrom2Nix {"
    echo "pname = \"${repo}\";"
    echo "version = \"${version}\";"
    echo "src = ${fetcher} ${src};"
  } >>"$nix_new_file"

  build_inputs="$(echo "$plugin" | jq -r '.nativeBuildInputs // empty' | jq -r @sh)"
  if [ -n "$build_inputs" ]; then
    {
      echo -n "nativeBuildInputs = with pkgs; ["
      echo -n "$build_inputs" | tr -d "'"
      echo '];'
    } >>"$nix_new_file"
  fi

  build_phase="$(echo "$plugin" | jq -r '.buildPhase // empty')"
  if [ -n "$build_phase" ]; then
    printf "buildPhase = ''\n%s\n'';\n" "$build_phase" >>"$nix_new_file"
  fi

  echo '};' >>"$nix_new_file"
done
echo "}" >>"$nix_new_file"

nixpkgs-fmt "$nix_new_file"

if test -f "$nix_file"; then
  set +eo pipefail
  difft "$nix_file" "$nix_new_file"
  set -eo pipefail

  mv "$nix_new_file" "$nix_file"
else
  mv "$nix_new_file" "$nix_file"

  set +eo pipefail
  bat --paging=never "$nix_file"
  set -eo pipefail
fi
