# ADR 0001: Steering versionado, sem memória

**Data**: 2026-11-15  
**Status**: Aceito

## Contexto

Na seção 02 do curso, precisávamos definir onde ficam as regras do projeto para o agente.

O Kiro oferece steering (regras em `.kiro/steering/`) e memória (contexto persistente entre sessões). Também vimos na aula 02-03 que uma regra de segurança (não ler `.env`) cedeu a um pedido insistente do usuário.

## Decisão

- As regras do projeto ficam em `.kiro/steering/`, versionadas no Git.
- Mudanças nas regras passam por pull request e revisão.
- A memória do Kiro fica desligada.
- O steering orienta o agente e não é tratado como barreira de segurança.

## Consequências

**Positivas:**
- Regras versionadas e auditáveis.
- Mudanças nas regras são rastreadas e revisadas.
- Quem clona o repositório recebe as mesmas regras.
- Sem estado oculto da memória.

**Negativas:**
- O agente pode passar por cima de uma regra diante de um pedido insistente. Barreiras entram com hooks e permissões, em seções futuras.
- Sem memória, o contexto entre sessões precisa ser reconstruído.

## Alternativas descartadas

- **Memória ligada**: traria estado implícito, difícil de versionar e auditar.
- **Steering como barreira**: o teste da aula 02-03 mostrou que o agente cede a um pedido insistente; tratar o steering como segurança seria enganoso.
