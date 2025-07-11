# 💹 Trading Agents CN

## 🐳 Docker Compose
```bash
mkdir /opt/trading-agents
cd /opt/trading-agents
wget https://raw.githubusercontent.com/aahl/trading-agents/refs/heads/main/docker-compose.yml

# 写入阿里云百炼API密钥 https://bailian.console.aliyun.com/?tab=model#/api-key
echo "DASHSCOPE_API_KEY=your_bailian_api_key" > .env

# 写入Finnhub API密钥 https://finnhub.io
echo "FINNHUB_API_KEY=your_finnhub_api_key" >> .env

docker compose up -d
docker compose logs -f -n 20

# 网页端访问 http://localhost:8501

# 终端交互命令
docker exec -it trading-agents uv run -m cli.main
```

## 🔗 Links
- https://github.com/hsliuping/TradingAgents-CN
