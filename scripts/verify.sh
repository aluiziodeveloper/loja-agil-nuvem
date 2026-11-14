#!/usr/bin/env bash
# Verificações do projeto, iguais na sua máquina e na CI. Roda dentro do serviço dev:
#   docker compose run --rm -T dev scripts/verify.sh
# Cada serviço acrescenta aqui as verificações dele (formatação, lint, tipos, testes, build).
set -euo pipefail
cd "$(dirname "$0")/.."

echo "== toolchain"
python3 --version
node --version
java -version 2>&1 | head -n 1
mvn -v | head -n 1
uv --version
aws --version

echo "== ok"
