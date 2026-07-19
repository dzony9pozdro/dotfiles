#!/usr/bin/env bash
set -euo pipefail

[ $# -lt 1 ] && { echo "usage: cnew <name>" >&2; exit 1; }

name="$1"
tpl="$HOME/.dotfiles/templates/c"

mkdir -p "$name"
cd "$name"

cp "$tpl"/{Makefile,.clang-tidy,.clang-format,compile_flags.txt,.gitignore} .

printf '#include <stdio.h>\n\nint main(void) {\n  return 0;\n}\n' > main.c
printf '# %s\n\nWIP\n' "$name" > README.md
echo "$name" >> .gitignore

git init -q
git add -A
git commit -qm "init"

echo "ready: $name"
