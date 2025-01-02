# O objetivo do script é realizar uma análise de arquivos e pastas em um diretório específico, identificando aqueles que foram criados nos últimos dias definidos.

# Definir o diretório para análise (pode ser alterado conforme necessário)
$rootPath = "C:\"  # Caminho principal para análise
$daysToAnalyze = 7  # Número de dias para filtrar arquivos e pastas criados recentemente

# Obter a pasta onde o script está sendo executado
$currentScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$reportPath = Join-Path -Path $currentScriptPath -ChildPath "Relatorio_Criacao.txt"

# Data limite para filtrar os arquivos e pastas
$dateLimit = (Get-Date).AddDays(-$daysToAnalyze)

# Inicializar um array para armazenar os resultados
$result = @()

# Função para buscar recursivamente arquivos e pastas criados
Write-Host "Buscando arquivos e pastas criados a partir de $dateLimit no diretório $rootPath..."

Get-ChildItem -Path $rootPath -Recurse -Force -ErrorAction SilentlyContinue | ForEach-Object {
    try {
        # Verificar se o item foi criado após a data limite
        if ($_.CreationTime -ge $dateLimit) {
            # Adicionar ao array com formato customizado
            $result += @"
Evento           : Criado
Nome             : $($_.Name)
Caminho Completo : $($_.FullName)
Data e Hora      : $($_.CreationTime.ToString('yyyy-MM-dd HH:mm:ss'))
"@
        }
    } catch {
        # Ignorar erros, como acesso negado
        Write-Host "Erro ao acessar $_.FullName. Ignorando..."
    }
}

# Verificar se houve resultados
if ($result.Count -gt 0) {
    # Salvar os resultados no relatório
    $result | Out-File -FilePath $reportPath -Encoding UTF8
    Write-Host "Relatório gerado com sucesso: $reportPath"
} else {
    Write-Host "Nenhum arquivo ou pasta criado nos últimos $daysToAnalyze dias foi encontrado no diretório $rootPath."
}
