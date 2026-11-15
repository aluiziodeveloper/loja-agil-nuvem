---
inclusion: always
---

# Docker

## Comandos dentro do contêiner

Python, Node.js, Java, Maven, uv, AWS CLI e CDK rodam dentro do serviço `dev`:

```bash
docker compose exec dev <comando>
```

## Comandos fora do contêiner

Git, GitHub CLI (`gh`) e Docker rodam diretamente no host.

## Endereço de rede

Dentro do contêiner, use `127.0.0.1`, não `localhost`.

## Verificação

```bash
docker compose run --rm -T dev scripts/verify.sh
```
