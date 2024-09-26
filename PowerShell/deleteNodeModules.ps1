Write-Host "Iniciando Script..." -ForegroundColor Yellow

# Define el directorio raíz desde donde quieres comenzar a buscar y eliminar los directorios node_modules
$rootDirectory = "D:\Proyectos"

Write-Host "Se definio la ruta exitosamente...$($rootDirectory)" -ForegroundColor Yellow

Write-Host "Iniciando busqueda de rutas en: $($rootDirectory)" -ForegroundColor Yellow

# Busca todos los directorios llamados "node_modules" dentro del directorio especificado y sus subdirectorios
$nodeModulesDirs = Get-ChildItem -Path $rootDirectory -Recurse -Directory -Filter "node_modules"

Write-Host "Fin de la busqueda: $($rootDirectory)" -ForegroundColor Green

# Si se encuentran directorios "node_modules", los eliminamos
if ($nodeModulesDirs.Count -gt 0) {
    foreach ($dir in $nodeModulesDirs) {
        try {
            Write-Host "Eliminando: $($dir.FullName)"
            Remove-Item -Recurse -Force -Path $dir.FullName
            Write-Host "Directorio eliminado exitosamente: $($dir.FullName)" -ForegroundColor Green
        } catch {
            Write-Host "Error eliminando el directorio: $($dir.FullName)" -ForegroundColor Red
            Write-Host $_.Exception.Message -ForegroundColor Red
        }
    }
} else {
    Write-Host "No se encontraron directorios 'node_modules' en el directorio especificado." -ForegroundColor Yellow
}

Write-Host "Finalizado..." -ForegroundColor Yellow