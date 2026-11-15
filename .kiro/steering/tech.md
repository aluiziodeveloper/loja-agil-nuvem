# Stack Técnica

## Linguagens e ferramentas

Versões fixas, todas dentro do serviço `dev` (`docker/dev/Dockerfile`):

| Ferramenta | Versão | Uso |
|------------|--------|-----|
| **Python** | 3.14.10 | catalog-importer (Lambda) |
| **Node.js** | 24.22.3 | price-alerts (CDK/TypeScript) |
| **Java (Temurin JDK)** | 25.0.5 | legacy-freight |
| **Maven** | 3.9.16 | Build e dependências Java |
| **uv** | 0.13.8 | Gerenciador de projetos Python |
| **AWS CLI** | 2.40.3 | Interação com serviços AWS |

Não troque uma versão sem um pull request próprio.

## Testes de propriedade

- Python: Hypothesis.
- TypeScript: fast-check.
- Java: jqwik.

## Ambiente de desenvolvimento

No host ficam só Git, Docker (com Docker Compose) e o GitHub CLI (`gh`). O resto roda no serviço `dev`:

```bash
docker compose up -d --build
docker compose exec dev bash
```

O serviço monta o código em `/workspace`, usa o mesmo UID/GID do host e não publica portas. As credenciais da AWS ficam no volume `aws-config`, não no host.

## Verificação

A mesma na máquina e na CI:

```bash
docker compose run --rm -T dev scripts/verify.sh
```

Hoje o script só confere as versões das ferramentas. Cada serviço acrescenta as suas verificações quando for criado.

## Fluxo de trabalho

GitHub Flow: uma branch por aula, pull request, squash merge com a CI verde. Commits e títulos de PR seguem o Conventional Commits. A `main` é protegida pelo ruleset de `.github/ruleset-main.json`, com os checks "Verify" e "Conventional PR title".

Para fechar uma aula: `scripts/pr.sh aula-MM-NN` (push, PR, espera os checks, squash merge e tag).
