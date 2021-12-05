pip install -i https://test.pypi.org/simple/ playfairwali
@echo off
setlocal EnableDelayedExpansion

set "fTmpPy=%TEMP%\~fTmp.py"

call :getLine "::python_beg" "::python_end" > "!fTmpPy!"

python "!fTmpPy!"

pause
exit /b 0

:getLine <beg str> <end str>
  set "bBegEnd=0"
  for /f "usebackq delims=" %%l in ("%~f0") do (
    if !bBegEnd! equ 1 (
      if "%%l" equ "%~2" ( exit /b 0 )
      setlocal DisableDelayedExpansion
      echo %%l
      endlocal
    ) else (
      if "%%l" equ "%~1" ( set "bBegEnd=1" )
    )
  )
exit /b 0

endlocal

::mark is unique - one character or string
::begin mark must be
::end mark is optional if it is on eof

::python_beg
from playfair import main
::python_end