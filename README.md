# RecentFileAudit
Script em PowerShell para monitorar e auditar arquivos e pastas criados recentemente em um diretório especificado. Ideal para administradores de sistemas e auditorias de segurança, o script gera um relatório detalhado com nome, caminho completo e data/hora de criação dos itens. Personalizável e fácil de usar!


## Script PowerShell: Identificando Arquivos e Pastas Criados Recentemente
Este repositório contém um script em PowerShell desenvolvido para identificar arquivos e pastas criados nos últimos X dias em um diretório especificado. Ele é útil para auditorias, monitoramento de mudanças ou até para fins de segurança cibernética.

## 🛠️ Funcionalidades
Busca recursiva em um diretório definido pelo usuário.
Filtragem de arquivos e pastas com base na data de criação.
Relatório gerado automaticamente no mesmo local do script.
Ignora erros de acesso (como permissões negadas).

## 📂 Relatório de Saída
O relatório inclui:

Nome do arquivo/pasta.
Caminho completo.
Data e hora de criação.
Exemplo de saída no arquivo ```Relatorio_Criacao.txt```:

```
Evento           : Criado
Nome             : exemplo.txt
Caminho Completo : C:\Users\Exemplo\Documents\exemplo.txt
Data e Hora      : 2025-01-01 10:30:00
```

## 📋 Possíveis Aplicações
Monitoramento de alterações em diretórios compartilhados.
Detecção de atividades suspeitas, como arquivos criados por malware.
Auditorias de segurança em sistemas de arquivos.


