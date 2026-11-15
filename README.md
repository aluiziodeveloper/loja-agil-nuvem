# Loja Ágil na Nuvem

Repositório-solução do curso **Kiro na Prática: desenvolvimento com IA guiado por specs**.

A Loja Ágil vende canecas, camisetas, adesivos e bonés. Este projeto leva três serviços do requisito à produção na AWS, com o Kiro e desenvolvimento guiado por specs:

- `catalog-importer` (Python, AWS Lambda): importa a planilha de preços dos fornecedores e publica `PriceChanged`;
- `price-alerts` (TypeScript, AWS CDK): avisa quando o preço cruza o alvo do cliente e publica `AlertTriggered`;
- `legacy-freight` (Java): o cálculo de frete legado, entendido, caracterizado e modernizado.

## Como seguir o curso

Cada aula prática termina numa tag `aula-MM-NN`. Para ver o código no estado de uma aula:

```bash
git clone https://github.com/aluiziodeveloper/loja-agil-nuvem
cd loja-agil-nuvem
git switch --detach aula-MM-NN
```

## Como rodar

Você precisa de Git, Docker (com Docker Compose) e, para abrir PRs, do GitHub CLI (`gh`). Python, Node, Java, Maven, uv e AWS CLI vêm no serviço `dev`, em versões fixas:

```bash
docker compose up -d --build
docker compose exec dev bash
```

| Ferramenta | Versão |
|---|---|
| Python | 3.14.10 |
| Node.js | 24.22.3 |
| JDK (Temurin) | 25.0.5 |
| Maven | 3.9.16 |
| uv | 0.13.8 |
| AWS CLI | 2.40.3 |

## Verificações

As mesmas na sua máquina e na CI:

```bash
docker compose run --rm -T dev scripts/verify.sh
```

## Fluxo de trabalho

GitHub Flow: cada aula nasce numa branch, vira um pull request e entra na `main` por squash merge com a CI verde. A `main` é protegida pelo ruleset de `.github/ruleset-main.json` (aplicado com `scripts/setup-github.sh`). Commits e títulos de PR seguem o Conventional Commits. Para fechar uma aula: `scripts/pr.sh aula-MM-NN`.

## Como o Kiro conhece este projeto

O Kiro lê as regras do projeto em `.kiro/steering/` (produto, stack, estrutura, contêiner, Python e segurança) e os procedimentos em `.kiro/skills/` (`/adr` e `/pr-description`). As decisões de arquitetura ficam em `docs/adr/` e os termos do projeto em `docs/glossary.md`. O steering orienta o agente; ele não é uma barreira de segurança.

## Estrutura

```text
.github/          CI, título do PR, Dependabot e o ruleset da main
.kiro/            steering e skills do Kiro
docker/dev/       imagem do serviço dev
docs/             visão geral, ADRs e glossário
scripts/          verify.sh, pr.sh, setup-github.sh
compose.yaml      o serviço dev, sem portas publicadas
```

## Licença

[MIT](LICENSE)
