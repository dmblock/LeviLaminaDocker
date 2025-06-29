# 必读文档

## 项目简介

本镜像基于 [LeviLamina](https://github.com/LiteLDev/LeviLamina) 项目，适用于 Minecraft Bedrock 服务器的高性能运行与二次开发。镜像已集成常用依赖和插件，开箱即用。

---

## 使用说明

### 1. 环境变量

**必须设置环境变量 `VERSION`，否则无法安装服务端。**

示例：
```bash
docker run -e VERSION=1.0.0 lantian/levilamina:latest
```

### 2. 镜像启动

- 默认启动命令会自动检测并安装服务端及依赖。
- 启动后服务端会自动运行。

### 3. 端口映射

请根据实际需求映射容器端口到主机端口，例如：
```bash
docker run -e VERSION=1.0.0 -p 19132:19132/udp lantian/levilamina:latest
```

### 4. 数据持久化

建议挂载数据目录以防止数据丢失：
```bash
docker run -e VERSION=1.0.0 -v /your/data/path:/data lantian/levilamina:latest
```

### 5. 镜像构建方法
1. 进入本项目目录，打开终端
2. 执行以下内容(请先安装nodejs)
```bash
npm run build
# 如果不需要nodejs,直接执行以下命令
docker build -t lantian/levilamina:latest .
```

---

## 常见问题

1. **未设置 VERSION 环境变量导致无法启动？**
   - 请务必在启动时通过 `-e VERSION=xxx` 指定版本号。

2. **如何更换/升级 LeviLamina 版本？**
   - 只需修改 `VERSION` 环境变量并重启容器。

3. **如何安装额外插件？**
   - 可在容器内使用 `lip install 插件名` 命令安装。

---

## 技术支持

如有疑问或需要技术支持，请联系您的服务提供商或项目交付方。

---



---

感谢您的使用！