@echo off
setlocal

:: Volta uma pasta atras para executar o comando de criar banco
cd ..

:: Define a pasta onde o script esta localizado
set "BASE_DIR=%cd%\"

:: Define os caminhos relativos, agora corrigidos para usar a variavel BASE_DIR
set "TOOLS_DIR=%BASE_DIR%1-STEP\spatialite-tools"
set "INPUT_FILE=%BASE_DIR%2-STEP\protobuf.osm.pbf"
set "OUTPUT_DB=%BASE_DIR%3-STEP\MyDBRouter.sqlite"

:: Exibe os valores para verificar se estao corretos
echo TOOLS_DIR: "%TOOLS_DIR%"
echo INPUT_FILE: "%INPUT_FILE%"
echo OUTPUT_DB: "%OUTPUT_DB%"

:: Executa o comando
"%TOOLS_DIR%\spatialite_osm_net.exe" -o "%INPUT_FILE%" -d "%OUTPUT_DB%" -T roads

pause
