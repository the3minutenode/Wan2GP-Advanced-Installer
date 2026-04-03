@echo off&&cd /d "%~dp0"

Title The 3-Minute Node Wan2GP Advanced Installer v0.2.1 (RTX 40XX, 50XX Only)
:: Specialized for Python 3.10 / CUDA 12.8 / PyTorch 2.7.1

setlocal enabledelayedexpansion

call :set_colors

:: Configuration for Python 3.10
set "PYTHON_URL=https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip"
set "TRITON_LIBS_URL=https://github.com/woct0rdho/triton-windows/releases/download/v3.0.0-windows.post1/python_3.10.11_include_libs.zip"
set "EMBED_DIR=%~dp0python_embeded"
set "WAN_DIR=%~dp0Wan2GP"
set "PYTHON_EXE=%EMBED_DIR%\python.exe"
set "PIP_INDEX=--index-url https://download.pytorch.org/whl/cu128"
set "PIP_OPTS=--no-cache-dir --no-warn-script-location --timeout=1000 --prefer-binary"

:: Prerequisites Check
where git >nul 2>nul || (echo %RED%[+] Git not found. Please install Git for Windows.%RESET% && pause && exit /b)
where curl >nul 2>nul || (echo %RED%[+] Curl not found. Update your Windows or install Curl.%RESET% && pause && exit /b)

echo %CYAN%[+] Creating Directories...%RESET%
if not exist "%EMBED_DIR%" mkdir "%EMBED_DIR%"

echo %CYAN%[+] Downloading Python 3.10 Embeddable...%RESET%
if not exist "python_embed.zip" curl --ssl-no-revoke -L -o python_embed.zip %PYTHON_URL%

echo %CYAN%[+] Extracting Python...%RESET%
powershell -Command "Expand-Archive -Path 'python_embed.zip' -DestinationPath '%EMBED_DIR%' -Force"
del python_embed.zip

echo %CYAN%[+] Handling Python Include/Libs...%RESET%
echo %CYAN%[+] Downloading 3.10 headers/libs for Triton...%RESET%
curl --ssl-no-revoke -L -o "python_libs.zip" %TRITON_LIBS_URL%
echo %CYAN%[+] Merging headers and libraries into %EMBED_DIR%...
powershell -Command "Expand-Archive -Path 'python_libs.zip' -DestinationPath '%EMBED_DIR%' -Force"
del python_libs.zip

echo %CYAN%[+] Configuring Python Paths...%RESET%
:: Create a fresh ._pth file to ensure site-packages and local dirs are mapped
(
  echo python310.zip
  echo .
  echo Lib/site-packages
  echo ../Wan2GP
  echo import site
) > "%EMBED_DIR%\python310._pth"

echo %CYAN%[+] Downloading pip...%RESET%
curl --ssl-no-revoke -L -o "%EMBED_DIR%\get-pip.py" https://bootstrap.pypa.io/get-pip.py
"%PYTHON_EXE%" -I "%EMBED_DIR%\get-pip.py" --no-warn-script-location
del "%EMBED_DIR%\get-pip.py"

echo %CYAN%[+] Cloning Wan2GP...%RESET%
if not exist "%WAN_DIR%" git clone https://github.com/deepbeepmeep/Wan2GP.git

echo %CYAN%[+] Installing PyTorch 2.7.1 + CUDA 12.8 ...%RESET%
REM "%PYTHON_EXE%" -I -m pip install torch==2.10.0 torchvision torchaudio %PIP_INDEX% %PIP_OPTS%
"%PYTHON_EXE%" -I -m pip install torch==2.7.1 torchvision==0.22.1 torchaudio==2.7.1 %PIP_INDEX% %PIP_OPTS%

echo %CYAN%[+] Installing Specialized 40XX, 50XX Kernels ...%RESET%
echo %CYAN%[+] Installing Triton for Windows...%RESET%
REM "%PYTHON_EXE%" -I -m pip install -U triton-windows %PIP_OPTS%
"%PYTHON_EXE%" -I -m pip install -U "triton-windows<3.4" %PIP_OPTS%

echo %CYAN%[+] Installing SageAttention 2.2.0 (CU128) + FlashAttention 2.7.4 ...%RESET%
REM "%PYTHON_EXE%" -I -m pip install https://github.com/woct0rdho/SageAttention/releases/download/v2.2.0-windows.post4/sageattention-2.2.0+cu130torch2.9.0andhigher.post4-cp39-abi3-win_amd64.whl %PIP_OPTS%
"%PYTHON_EXE%" -I -m pip install https://github.com/woct0rdho/SageAttention/releases/download/v2.2.0-windows/sageattention-2.2.0+cu128torch2.7.1-cp310-cp310-win_amd64.whl %PIP_OPTS%
REM "%PYTHON_EXE%" -I -m pip install https://github.com/deepbeepmeep/kernels/releases/download/Flash2/flash_attn-2.8.3-cp311-cp311-win_amd64.whl %PIP_OPTS%
"%PYTHON_EXE%" -I -m pip install https://github.com/Redtash1/Flash_Attention_2_Windows/releases/download/v2.7.0-v2.7.4/flash_attn-2.7.4.post1+cu128torch2.7.0cxx11abiFALSE-cp310-cp310-win_amd64.whl %PIP_OPTS%
REM "%PYTHON_EXE%" -I -m pip install https://github.com/deepbeepmeep/kernels/releases/download/GGUF_Kernels/llamacpp_gguf_cuda-1.0.2+torch210cu13py311-cp311-cp311-win_amd64.whl %PIP_OPTS%
"%PYTHON_EXE%" -I -m pip install https://github.com/deepbeepmeep/kernels/releases/download/GGUF_Kernels/llamacpp_gguf_cuda-1.0.2+torch271cu128py310-cp310-cp310-win_amd64.whl %PIP_OPTS%

echo %CYAN%[+] Installing Wan2GP requirements...%RESET%
"%PYTHON_EXE%" -m pip install -r "%WAN_DIR%\requirements.txt" %PIP_OPTS%

echo.
echo %CYAN%[+] Making run.bat...%RESET%
(
echo @echo off
echo cd Wan2GP
echo start /b cmd /c "timeout /t 3 /nobreak >nul & start "" "http://127.0.0.1:7860""
echo ..\python_embeded\python.exe -s -W ignore::FutureWarning wgp.py
echo pause
) > run.bat

echo.
echo %CYAN%[+] Setup Complete for RTX 40XX, 50XX and Wan2GP.%RESET%
pause
exit /b

:: subroutines
:set_colors
for /f "delims=" %%a in ('powershell -command "[char]27"') do set "ESC=%%a"
set "RESET=%ESC%[0m"
set "GREEN=%ESC%[92m"
set "CYAN=%ESC%[96m"
set "RED=%ESC%[91m"
set "YELLOW=%ESC%[93m"
exit /b
