#! /usr/bin/env bash

VERSION=$1

# 检测VERSION环境变量
if [ -z "$VERSION" ]; then
  echo "在新版lip中，你必须传入环境变量VERSION，否则无法安装服务端"
  exit 1
fi

# 检查服务端是否安装，若未安装则开始安装
if [ ! -f "bedrock_server_mod.exe" ]; then
  lip config set github_proxies="https://github.bibk.top"
  lip config set go_module_proxies="https://goproxy.io"
  lip install github.com/LiteLDev/LeviLamina@"$VERSION"
  lip install github.com/LiteLDev/LegacyScriptEngine#lua
  lip install github.com/LiteLDev/LegacyScriptEngine#quickjs
  lip install github.com/LiteLDev/LegacyScriptEngine#nodejs
fi

# 这里可以加入你的启动之前执行的命令



# 这里可以加入你的启动之前执行的命令

# 启动服务端命令
./bedrock_server_mod.exe