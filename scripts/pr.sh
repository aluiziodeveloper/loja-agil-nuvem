#!/usr/bin/env bash
# Fecha uma aula sempre do mesmo jeito: push da branch, PR, checks verdes, squash merge e tag.
# Uso (na branch da aula, com o commit feito): scripts/pr.sh aula-MM-NN
set -euo pipefail
tag="${1:?informe a tag da aula, por exemplo aula-01-03}"
branch="$(git branch --show-current)"
[ "$branch" != "main" ] || { echo "rode na branch da aula, não na main" >&2; exit 1; }
[ -z "$(git status --porcelain)" ] || { echo "há mudanças sem commit" >&2; exit 1; }

git push -u origin "$branch"
gh pr view --json number >/dev/null 2>&1 || gh pr create --fill
sleep 10  # dá tempo de os checks aparecerem no PR
gh pr checks --watch --fail-fast
gh pr merge --squash --delete-branch
git switch main
git pull --ff-only
git tag -a "$tag" -m "$tag"
git push origin "$tag"
echo "ok: $tag publicada"
