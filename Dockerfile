FROM dmbk/msys2:ltsc2022

COPY resources/ C:/resources/
COPY src/install.sh C:/install.sh
COPY src/entrypoint.sh C:/entrypoint.sh

SHELL ["C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe", "-NoProfile", "-InputFormat", "None", "-ExecutionPolicy", "Bypass", "-Command"]
RUN iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

ENV Path="C:\msys64\mingw64\bin;C:\msys64\usr\local\bin;C:\msys64\usr\bin;C:\msys64\usr\bin;C:\Windows\System32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\msys64\usr\bin\site_perl;C:\msys64\usr\bin\vendor_perl;C:\msys64\usr\bin\core_perl"

SHELL ["bash", "-c"]

RUN "mv /c/resources/choco.exe /c/msys64/usr/bin/choco.exe"
RUN "mv /c/resources/lip.exe /c/msys64/usr/bin/lip.exe"
RUN "mv /c/entrypoint.sh /c/msys64/usr/bin/bluesky"

RUN "bash -c /c/install.sh"

# 如果你想使用默认的启动命令，就取消下面的注释,翼龙和mcsm不需要取消注释
# ENTRYPOINT ["bash", "-c", "bluesky"]
