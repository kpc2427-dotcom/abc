#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="$ROOT/dist"
B64="${TMPDIR:-/tmp}/loyumi-source.tar.gz.b64"
TGZ="${TMPDIR:-/tmp}/loyumi-source.tar.gz"

rm -rf "$DIST"
mkdir -p "$DIST"

cat "$ROOT"/.bootstrap/chunk-* > "$B64"
echo "2410339f7bf2aa5bc27d9c84f4446b0bbbe724c3ed3d6b7786c1313ed5a06cdb  $B64" | sha256sum --check --strict
base64 --decode "$B64" > "$TGZ"
echo "6acda8090a4864158251ebf1a9d169d99dba200b88ca98ee27c45013ef440cca  $TGZ" | sha256sum --check --strict

tar -xzf "$TGZ" -C "$DIST"

# The transport archive contains the exact QA-validated release tree.
test -f "$DIST/index.html"
test -f "$DIST/old/index.html"
test -f "$DIST/assets/styles.css"
test -f "$DIST/assets/app.js"

printf 'Loyumi release reconstructed at %s\n' "$DIST"
