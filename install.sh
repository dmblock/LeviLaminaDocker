#! /usr/bin/env bash

# 全局允许自动确认
choco feature enable -n allowGlobalConfirmation

# 安装vcruntime2022
choco install vcredist140 --no-progress -y
# 安装dotnet9 runtime
choco install dotnet-runtime --no-progress -y

exit 0