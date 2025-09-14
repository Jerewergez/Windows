Clear-Host

# 🎨 Oh My Posh: tema personalizado
oh-my-posh init pwsh --config "C:\Users\i44475827\Documents\WindowsPowerShell\MyWindows\MyTheme.omp.json" | Invoke-Expression

# 📁 Alias útiles
function d { eza --icons --git -la @args }
function n { nvim @args }
function gcs { Invoke-Expression \py C:\Users\i44475827\Documents\Scripts\Python\AutomatizacionBasesTeco\AutoGCS\AutoGCS.py }

# 📄 Importar CSV con delimitador ';'
function Import-CsvSemicolon {
    param ([string]$Path)
    if (Test-Path $Path) {
        Import-Csv -Path $Path -Delimiter ';'
    } else {
        Write-Warning "El archivo no existe: $Path"
    }
}

# 🔍 Listar columnas
function ListarColumnas {
    param ([string]$Path)
    Import-CsvSemicolon $Path | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name
}

# 📊 Valores únicos por columna
function ValoresUnicos {
    param ([string]$Path, [string]$Columna)
    Import-CsvSemicolon $Path | Select-Object -ExpandProperty $Columna | Sort-Object | Get-Unique
}

# 📈 Conteo por categoría
function ConteoPorColumna {
    param ([string]$Path, [string]$Columna)
    Import-CsvSemicolon $Path | Group-Object -Property $Columna | Select-Object Name, @{Name="Cantidad";Expression={$_.Count}}
}

# 💰 Suma por grupo
function SumaPorGrupo {
    param ([string]$Path, [string]$Grupo, [string]$ColumnaSuma)
    Import-CsvSemicolon $Path | Group-Object -Property $Grupo | ForEach-Object {
        [PSCustomObject]@{
            Grupo = $_.Name
            Total = ($_.Group | Measure-Object -Property $ColumnaSuma -Sum).Sum
        }
    }
}

# 📅 Filtrar por rango de fechas
function FiltrarPorFecha {
    param (
        [string]$Path,
        [string]$ColumnaFecha,
        [datetime]$Desde,
        [datetime]$Hasta
    )
    Import-CsvSemicolon $Path | Where-Object {
        $fecha = [datetime]::ParseExact($_.$ColumnaFecha, 'dd/MM/yyyy', $null)
        $fecha -ge $Desde -and $fecha -le $Hasta
    }
}

# 👀 Visualización interactiva
function VerCsv {
    param ([string]$Path)
    Import-CsvSemicolon $Path | Out-GridView
}
function acsv {
    param ([string]$Path)

    $datos = Import-Csv -Path $Path -Delimiter ';'
    if ($datos.Count -eq 0) {
        Write-Warning "El archivo está vacío o no tiene registros."
        return
    }

    $columnas = $datos[0].PSObject.Properties.Name

    foreach ($col in $columnas) {
        $valores = $datos | Select-Object -ExpandProperty $col | Where-Object { $_ -ne $null -and $_ -ne "" }

        # Intentar convertir cada valor a su tipo más probable
        $tiposDetectados = @()
        foreach ($v in $valores) {
            if ([datetime]::TryParse($v, [ref]$null)) {
                $tiposDetectados += 'DateTime'
            } elseif ($v -match '^\d+(\.\d+)?$') {
                $tiposDetectados += 'Number'
            } else {
                $tiposDetectados += 'String'
            }
        }

        $tipoPrincipal = ($tiposDetectados | Group-Object | Sort-Object Count -Descending)[0].Name

        Write-Host "`nColumna: $col"
        Write-Host "Tipo detectado: $tipoPrincipal"

        switch ($tipoPrincipal) {
            'DateTime' {
                $fechas = $valores | ForEach-Object { [datetime]$_ }
                $min = $fechas | Sort-Object | Select-Object -First 1
                $max = $fechas | Sort-Object | Select-Object -Last 1
                Write-Host "Fecha mínima: $min"
                Write-Host "Fecha máxima: $max"
            }
            'Number' {
                $numeros = $valores | ForEach-Object { [double]$_ }
                $min = ($numeros | Measure-Object -Minimum).Minimum
                $max = ($numeros | Measure-Object -Maximum).Maximum
                Write-Host "Mínimo: $min"
                Write-Host "Máximo: $max"
            }
            'String' {
                $unicos = $valores | Sort-Object | Get-Unique
                Write-Host "Valores únicos: $($unicos.Count)"
            }
        }
    }
}
