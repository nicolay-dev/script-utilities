# Define la ruta del directorio en el que quieres buscar
$directory = "E:\"

# Obtiene todos los archivos ocultos que empiezan con ._ en el directorio y subdirectorios
$hiddenFiles = Get-ChildItem -Path $directory -Recurse -Force -File | Where-Object {
    $_.Name -like "._*" -and $_.Attributes -band [System.IO.FileAttributes]::Hidden
}

# Elimina los archivos encontrados
if ($hiddenFiles) {
    Write-Host "Archivos ocultos que empiezan con ._ encontrados en ${directory}. Procediendo a eliminarlos..." -ForegroundColor Green
    $hiddenFiles | ForEach-Object {
        Remove-Item -Path $_.FullName -Force
        Write-Host "Eliminado: $_.FullName" -ForegroundColor Red
    }
    Write-Host "Eliminación completada." -ForegroundColor Green
} else {
    Write-Host "No se encontraron archivos ocultos que empiecen con ._ en ${directory}" -ForegroundColor Yellow
}
