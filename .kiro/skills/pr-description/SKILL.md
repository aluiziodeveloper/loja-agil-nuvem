---
name: pr-description
description: Escreve a descrição de um pull request deste projeto, em três seções fixas. Use quando pedirem a descrição de um PR.
---

# Descrição de Pull Request

Leia o diff com `git diff main...HEAD --stat` e escreva a descrição do PR com exatamente três seções, nesta ordem:

## O que muda

Resumo direto das mudanças: arquivos criados, modificados ou removidos, e o que cada um faz. Uma ou duas linhas por arquivo relevante.

## Como conferir

Os comandos de verificação do projeto:

```bash
docker compose run --rm -T dev scripts/verify.sh
```

Adicione comandos específicos se a mudança introduzir testes ou outras verificações.

## História do agente

- Pedidos feitos pelo usuário
- Modelo usado (ex: claude-sonnet-4.5)
- Créditos gastos (aproximados)
- O que a revisão humana mudou (ou "Nenhuma revisão ainda")
