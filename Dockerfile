FROM ghcr.io/astral-sh/uv:python3.10-bookworm

ARG VERSION=main
ENV UV_HTTP_TIMEOUT=60 \
    # UV_DEFAULT_INDEX=https://mirrors.ustc.edu.cn/pypi/simple \
    UV_NO_CACHE=true

WORKDIR /app
RUN set -eux; \
    # sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources; \
    apt update; \
    apt install -y --no-install-recommends wget; \
    wget https://github.com/hsliuping/TradingAgents-CN/archive/refs/heads/main.tar.gz -O- | tar zxvf - --strip 1 -C /app; \
    sed -i 's/localhost/0.0.0.0/g' .streamlit/config.toml; \
    uv venv;
RUN uv add -r requirements.txt;

CMD ["uv", "run", "streamlit", "run", "web/app.py"]
HEALTHCHECK --interval=1m --start-period=50s CMD wget --spider --no-verbose 0.0.0.0:8501 || exit 1
