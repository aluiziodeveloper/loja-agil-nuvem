# Estrutura do Projeto

## Árvore de diretórios

```
loja-agil-nuvem/
├── .github/              # CI, título do PR, Dependabot e o ruleset da main
│   ├── workflows/        # GitHub Actions: ci.yml e pr-title.yml
│   ├── dependabot.yml    # Atualizações de actions e da imagem do serviço dev
│   └── ruleset-main.json # Ruleset de proteção da branch main
├── docker/
│   └── dev/
│       └── Dockerfile    # Imagem do serviço dev
├── docs/                 # Documentação do projeto
│   └── project-overview.md
├── scripts/
│   ├── verify.sh         # Verificações (na máquina e na CI)
│   ├── pr.sh             # Push, PR, merge e tag de uma aula
│   └── setup-github.sh   # Aplica o ruleset de proteção da main
├── compose.yaml          # Docker Compose: serviço dev
├── LICENSE               # MIT License
└── README.md             # Documentação principal
```

## Serviços

As pastas `catalog-importer/`, `price-alerts/` e `legacy-freight/` ainda não existem. Cada serviço vai viver na sua própria pasta, na raiz, quando a spec dele for implementada. Não crie essas pastas antes disso.

## Convenções

- Branch: `tipo/descricao-curta`, com o tipo do Conventional Commits (`feat/`, `fix/`, `chore/`, `docs/`).
- Tag: `aula-MM-NN`, uma por aula prática, criada pelo `scripts/pr.sh`.
- Identificadores em inglês; textos e documentação em português.
