#!/usr/bin/env nix-shell
#!nix-shell update-shell.nix -i bash
# shellcheck shell=bash disable=SC2154

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
{
  echo '# This file has been auto-generated'
  echo '{ pkgs, ... }:'
  echo 'let'
  echo 'inherit (pkgs) fetchFromGitHub;'
  # echo 'inherit (pkgs) fetchFromSourcehut;'
  echo 'inherit (pkgs.vimUtils) buildVimPlugin;'
  echo 'in'
  echo '{'
} >>"$nix_new_file"

for plugin in "${plugin_array[@]}"; do
  raw_src="$(echo "$plugin" | dasel -r json -w - '.src')"
  owner="$(echo "$raw_src" | awk -F'/' '{ print $(NF-1) }')"
  repo="$(echo "$raw_src" | awk -F'/' '{ print $(NF) }')"
  name="$(echo "$repo" | tr '.' '-')"

  echo "Updating ${owner}/${repo} ..."

  if [[ $raw_src == http* ]]; then
    clone_src="$raw_src"
  else
    clone_src="https://github.com/${owner}/${repo}.git"
  fi

  nix_prefetch_flags="--quiet"

  fetch_submodules="$(echo "$plugin" | jq -r '.fetchSubmodules // empty')"
  if [ "$fetch_submodules" == "true" ]; then
    nix_prefetch_flags+=" --fetch-submodules"
  fi

  rev="$(echo "$plugin" | jq -r '.rev // empty')"
  if [ -n "$rev" ]; then
    nix_prefetch_flags+=" --rev $rev"
  fi

  branch="$(echo "$plugin" | jq -r '.branch // empty')"
  if [ -n "$branch" ]; then
    nix_prefetch_flags+=" --branch-name $branch"
  fi

  # shellcheck disable=SC2086
  src_json="$(nix-prefetch-git $nix_prefetch_flags "$clone_src")"
  src="{
    owner = \"${owner}\";
    repo = \"${repo}\";
    rev = \"$(echo "$src_json" | dasel -r json -w - '.rev')\";
    sha256 = \"$(echo "$src_json" | dasel -r json -w - '.sha256')\";
    fetchSubmodules = $(echo "$src_json" | dasel -r json -w - '.fetchSubmodules');
  }"

  commit_date="$(echo "$src_json" | dasel -r json -w - '.date')"
  version="$(date -d "$commit_date" "+%Y-%m-%d")"

  case "$clone_src" in
  https://github.com*)
    fetcher="fetchFromGitHub"
    ;;
  https://git.sr.ht*)
    fetcher="fetchFromSourcehut"
    ;;
  *)
    echo "Unsupported URL: $clone_src"
    exit 1
    ;;
  esac

  case "$name" in
  #nvim-treesitter)
  #  echo "${name} = pkgs.vimPlugins.nvim-treesitter.overrideAttrs (_: {" >>"$nix_new_file"
  #  close_block="});"
  #  ;;
  coq_nvim)
    echo "${name} = pkgs.vimPlugins.coq_nvim.overrideAttrs (_: {" >>"$nix_new_file"
    close_block="});"
    ;;
  *)
    {
      echo "${name} = buildVimPlugin {"
      echo "pname = \"${repo}\";"
    } >>"$nix_new_file"
    close_block="};"
    ;;
  esac

  {
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

  echo "$close_block" >>"$nix_new_file"
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
