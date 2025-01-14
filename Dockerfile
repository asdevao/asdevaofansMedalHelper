# 使用官方的 Python 镜像（此处使用 3.9-alpine）
FROM python:3.9-alpine

# 设置时区为上海
ENV TZ="Asia/Shanghai"

# 设置工作目录为应用目录
WORKDIR /app

# 将当前目录下的所有文件复制到容器的 /app 目录
COPY . /app

# 使用阿里云镜像源加速 pip 安装速度
RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ \
    && pip install --no-cache-dir -r /app/requirements.txt

# 设置容器启动时执行的命令
ENTRYPOINT ["python", "main.py"]
