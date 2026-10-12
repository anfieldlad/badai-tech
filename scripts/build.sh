#!/bin/sh
# Build: copy the static site into dist/. Fails loudly if anything required is missing.
set -eu

REQUIRED="index.html portfolio.html robots.txt sitemap.xml _headers favicon.svg favicon.ico favicon-32.png apple-touch-icon.png og.jpg portfolio"

missing=0
for f in $REQUIRED; do
  if [ ! -e "$f" ]; then
    echo "build: ERROR required file missing: $f" >&2
    missing=1
  fi
done
[ "$missing" -eq 0 ] || exit 1

mkdir -p dist
cp -r *.html *.png *.ico *.svg *.jpg robots.txt sitemap.xml _headers portfolio dist/
