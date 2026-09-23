#!/usr/bin/env bash
set -euo pipefail

sudo dnf install -y google-noto-sans-fonts google-noto-emoji-fonts

font_src="$HOME/.src/comic-shanns-mono"
font_dir="$HOME/.local/share/fonts/ComicShannsMono"

mkdir -p "$(dirname "$font_src")" "$font_dir"
if [[ ! -d "$font_src/.git" ]]; then
    git clone --depth 1 https://github.com/jesusmgg/comic-shanns-mono.git "$font_src"
else
    git -C "$font_src" pull --ff-only
fi

shopt -s nullglob
font_files=("$font_src"/fonts/*.ttf "$font_src"/fonts/*.otf)
if ((${#font_files[@]} == 0)); then
    printf 'No TTF or OTF font files found in %s/fonts.\n' "$font_src" >&2
    exit 1
fi
cp -f -- "${font_files[@]}" "$font_dir/"
fc-cache -f "$font_dir"
