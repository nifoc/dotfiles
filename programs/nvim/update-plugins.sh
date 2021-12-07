#!/usr/bin/env nix-shell
#!nix-shell update-shell.nix -i bash

script_dir="$(dirname "$(realpath "$0")")"
plugins="${script_dir}/plugins.txt"
nix_new_file="${script_dir}/plugins_new.nix"
nix_file="${script_dir}/plugins.nix"

echo '# This file has been auto-generated' >"$nix_new_file"
echo '{ pkgs, ... }:' >>"$nix_new_file"

echo "{" >>"$nix_new_file"
while IFS='' read -r LINE || [ -n "${LINE}" ]; do
  owner="$(echo "$LINE" | cut -d'/' -f1)"
  repo="$(echo "$LINE" | cut -d'/' -f2)"
  build="$(echo "$LINE" | cut -d'/' -f3)"
  name="$(echo "$repo" | tr [.] '-')"
  src="$(nix-prefetch-github --nix --no-fetch-submodules "$owner" "$repo" 2>/dev/null | tail -n +4)"
  rev="$(echo "$src" | grep rev | cut -d '"' -f 2)"

  echo "Updating ${owner}/${repo} ..."

  echo "${name} = pkgs.vimUtils.buildVimPluginFrom2Nix {" >>"$nix_new_file"
  echo "pname = \"${repo}\";" >>"$nix_new_file"
  echo "version = \"${rev:0:7}\";" >>"$nix_new_file"
  echo "src = ${src};" >>"$nix_new_file"

  if [ -n "$build" ]; then
    echo "buildPhase = \"${build}\";" >>"$nix_new_file"
  fi

  echo "meta.homepage = \"https://github.com/${owner}/${repo}\";" >>"$nix_new_file"
  echo '};' >>"$nix_new_file"
done <"$plugins"
echo "}" >>"$nix_new_file"

nixpkgs-fmt "$nix_new_file"

if test -f "$nix_file"; then
  diff -U 2 "$nix_file" "$nix_new_file" | bat --paging=never -ldiff
  mv "$nix_new_file" "$nix_file"
else
  mv "$nix_new_file" "$nix_file"
  bat --paging=never "$nix_file"
fi
