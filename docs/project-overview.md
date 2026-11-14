# Visão Geral do Projeto

## O que é

Repositório-solução do curso **Kiro na Prática: desenvolvimento com IA guiado por specs**.

A Loja Ágil vende canecas, camisetas, adesivos e bonés. O projeto levará três serviços do requisito à produção na AWS:

- `catalog-importer` (Python, AWS Lambda): importa planilha de preços e publica `PriceChanged`
- `price-alerts` (TypeScript, AWS CDK): avisa quando o preço cruza o alvo e publica `AlertTriggered`
- `legacy-freight` (Java): cálculo de frete legado, a ser entendido, caracterizado e modernizado

## Como rodar

O ambiente de desenvolvimento roda em Docker Compose com Python 3.14.10, Node.js 24.22.3, JDK 25.0.5, Maven 3.9.16, uv 0.13.8 e AWS CLI 2.40.3:

```bash
docker compose up -d --build
docker compose exec dev bash
```

Você precisa de Git, Docker (com Docker Compose) e, para abrir PRs, do GitHub CLI (`gh`).

## Verificações

As mesmas verificações rodam na sua máquina e na CI:

```bash
docker compose run --rm -T dev scripts/verify.sh
```

Atualmente, o script verifica apenas as versões das ferramentas instaladas. Conforme cada serviço for implementado, ele acrescentará suas verificações (formatação, lint, tipos, testes, build).

## Estrutura

```text
.github/          CI, título do PR, Dependabot e o ruleset da main
docker/dev/       imagem do serviço dev
scripts/          verify.sh, pr.sh, setup-github.sh
compose.yaml      o serviço dev, sem portas publicadas
```

O serviço `dev` usa volumes para o workspace e caches (uv, npm, Maven). A configuração e credenciais da AWS ficam num volume próprio, não no `~/.aws` do host.

## O que ainda não existe

Os três serviços (`catalog-importer`, `price-alerts` e `legacy-freight`) serão implementados ao longo do curso. Por enquanto, o repositório contém apenas a infraestrutura de desenvolvimento e CI/CD.

Cada aula prática adiciona funcionalidades e termina numa tag `aula-MM-NN`. O fluxo de trabalho segue o GitHub Flow: branches viram pull requests, entram na `main` por squash merge com CI verde, e as branches são deletadas automaticamente.
