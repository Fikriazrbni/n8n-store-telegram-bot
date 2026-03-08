FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Environment variables
ENV N8N_PORT=8080
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https
ENV WEBHOOK_URL=https://n8n-store-telegram-bot-production.up.railway.app
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=password123
ENV TZ=Asia/Jakarta
ENV NODE_TLS_REJECT_UNAUTHORIZED=0

# Expose port 8080 (Railway default)
EXPOSE 8080

# Start n8n
CMD ["n8n"]
