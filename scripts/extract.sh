#!/bin/bash
# Verify and extract pinned ics-os-contrib source tarballs.
#
# Usage:
#   scripts/extract.sh              # extract every tarball in sources/
#   scripts/extract.sh gcc binutils # extract only the listed components
#
# Component names are the tarball basename without .tar.gz. Extracted trees are
# placed under sources/extract/<component>/ and are ignored by git.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/sources"
EX="$SRC/extract"

resolve_name() {
  local name="$1"
  if [ -f "$SRC/$name.tar.gz" ]; then
    printf '%s\n' "$name"
    return 0
  fi
  local match
  match="$(cd "$SRC" && ls "$name"-*.tar.gz 2>/dev/null | head -n 1)"
  if [ -n "$match" ]; then
    printf '%s\n' "${match%.tar.gz}"
    return 0
  fi
  echo "ERROR: no tarball matching $name in $SRC" >&2
  exit 1
}

manifest_check() {
  local name="$1"
  local tarball="$SRC/$name.tar.gz"
  if [ ! -f "$tarball" ]; then
    echo "ERROR: missing tarball $tarball" >&2
    exit 1
  fi
  (
    cd "$SRC"
    grep " $name.tar.gz\$" MANIFEST.sha256 | sha256sum -c -
  )
}

extract_one() {
  local name="$1"
  local dir="$EX/$name"
  manifest_check "$name"
  if [ -e "$dir" ]; then
    echo "already extracted: $name"
    return 0
  fi
  mkdir -p "$EX"
  tar -C "$EX" -xzf "$SRC/$name.tar.gz"
  echo "extracted: $name -> $dir"
}

if [ "$#" -eq 0 ]; then
  mapfile -t names < <(cd "$SRC" && ls *.tar.gz | sed 's/\.tar\.gz$//')
else
  names=("$@")
fi

for name in "${names[@]}"; do
  extract_one "$(resolve_name "$name")"
done
