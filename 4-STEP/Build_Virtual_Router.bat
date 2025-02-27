@echo off
setlocal

:: Volta uma pasta atras para executar o comando de criar banco
cd ..

:: Define a pasta onde o script esta localizado
set "BASE_DIR=%cd%\"

:: Define os caminhos relativos, agora corrigidos para usar a variavel BASE_DIR
set "TOOLS_DIR=%BASE_DIR%1-STEP\spatialite-tools"
set "INPUT_FILE=%BASE_DIR%3-STEP\MyDBRouter.sqlite"

:: Exibe os valores para verificar se estao corretos
echo TOOLS_DIR: "%TOOLS_DIR%"
echo INPUT_FILE: "%INPUT_FILE%"

:: Executa o comando
"%TOOLS_DIR%\spatialite_network.exe" -d "%INPUT_FILE%" -T "roads" -f "node_from" -t "node_to" -g "geometry" -c "cost"   --name-column "name" --oneway-tofrom "oneway_tofrom" --oneway-fromto "oneway_fromto" --virtual-table "NetworkTime" -o "Network" --overwrite-output
"%TOOLS_DIR%\spatialite_network.exe" -d "%INPUT_FILE%" -T "roads" -f "node_from" -t "node_to" -g "geometry" -c "length" --name-column "name" --oneway-tofrom "oneway_tofrom" --oneway-fromto "oneway_fromto" --virtual-table "NetworkDist" -o "Network" --overwrite-output

pause