# Define la ruta del directorio en el que quieres buscar
$directory = "E:\"

# Obtiene todos los archivos .DS_Store en el directorio y subdirectorios
$dsStoreFiles = Get-ChildItem -Path $directory -Recurse -Force -File | Where-Object {
    $_.Name -eq ".DS_Store"
}

# Elimina los archivos encontrados
if ($dsStoreFiles) {
    Write-Host "Archivos .DS_Store encontrados en ${directory}. Procediendo a eliminarlos..." -ForegroundColor Green
    $dsStoreFiles | ForEach-Object {
        Remove-Item -Path $_.FullName -Force
        Write-Host "Eliminado: $_.FullName" -ForegroundColor Red
    }
    Write-Host "Eliminación de archivos .DS_Store completada." -ForegroundColor Green
} else {
    Write-Host "No se encontraron archivos .DS_Store en ${directory}" -ForegroundColor Yellow
}
