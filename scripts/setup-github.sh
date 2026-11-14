#!/usr/bin/env bash
# Protege a main com o ruleset versionado em .github/ruleset-main.json (repositório público).
# Uso: scripts/setup-github.sh   (requer gh autenticado; roda no host, uma vez)
set -euo pipefail
cd "$(dirname "$0")/.."
repo="$(gh repo view --json nameWithOwner -q .nameWithOwner)"
name="$(python3 -c 'import json; print(json.load(open(".github/ruleset-main.json"))["name"])')"

gh repo edit "$repo" --enable-squash-merge --enable-merge-commit=false \
  --enable-rebase-merge=false --delete-branch-on-merge

id="$(gh api "repos/$repo/rulesets" -q ".[] | select(.name == \"$name\") | .id")"
if [ -n "$id" ]; then
  gh api -X PUT "repos/$repo/rulesets/$id" --input .github/ruleset-main.json >/dev/null
  echo "ok: ruleset \"$name\" atualizado em $repo"
else
  gh api -X POST "repos/$repo/rulesets" --input .github/ruleset-main.json >/dev/null
  echo "ok: ruleset \"$name\" criado em $repo"
fi
