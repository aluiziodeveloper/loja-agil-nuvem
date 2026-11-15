# Glossário

Termos novos de cada seção do curso. Seção 02:

| Termo | Definição |
|-------|-----------|
| **Contexto** | O texto que acompanha um pedido: a mensagem, os anexos, o steering e o que o agente leu na conversa. |
| **Steering** | Arquivo Markdown em `.kiro/steering/` que descreve o projeto e as regras dele para o agente. |
| **`always`** | Modo de inclusão padrão: o steering entra em toda conversa. |
| **`fileMatch`** | Modo de inclusão em que o steering entra quando o agente trabalha num arquivo que casa com o padrão. |
| **`manual`** | Modo de inclusão em que o steering só entra quando o usuário chama. |
| **`auto`** | Modo de inclusão em que o agente carrega o steering quando o assunto combina com a descrição do arquivo. |
| **AGENTS.md** | Arquivo na raiz do repositório, incluído em toda conversa e lido também por outras ferramentas de IA. |
| **Skill** | Procedimento em `.kiro/skills/<nome>/SKILL.md`, ativado pela descrição ou pelo comando `/nome`. |
| **Power** | Pacote instalável que junta skills e conexões com ferramentas externas. |
| **Memória** | Recurso do Kiro que guarda o que aprendeu numa conversa para usar nas próximas; desligado neste projeto. |
| **`.kiroignore`** | Arquivo com a sintaxe do `.gitignore` que lista o que o agente não deve ler; no Kiro CLI 3.3.0 ele não bloqueou a leitura (aula 02-03). |
