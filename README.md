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

Como rodar, as verificações e a estrutura do projeto entram neste README a partir da aula 01-03.
