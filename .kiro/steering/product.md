# Produto

## O que é

**Loja Ágil na Nuvem** é o repositório-solução do curso "Kiro na Prática: desenvolvimento com IA guiado por specs".

A Loja Ágil é uma loja fictícia que vende canecas, camisetas, adesivos e bonés. O projeto leva três serviços do requisito à produção na AWS, com o Kiro e desenvolvimento guiado por specs.

## Para quem

Alunos do curso, que acompanham o código pela tag de cada aula (`aula-MM-NN`).

## Serviços

Nenhum dos três existe ainda no repositório. Cada um nasce de uma spec, numa seção do curso.

- `catalog-importer` (Python, AWS Lambda): importa a planilha de preços dos fornecedores e publica o evento `PriceChanged`.
- `price-alerts` (TypeScript, AWS CDK): avisa quando o preço cruza o alvo do cliente e publica o evento `AlertTriggered`.
- `legacy-freight` (Java): o cálculo de frete legado, entendido, caracterizado e modernizado.
