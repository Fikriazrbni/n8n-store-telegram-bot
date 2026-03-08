FROM n8nio/n8n:latest

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

# Expose port
EXPOSE 8080

# Use the default entrypoint from n8n image
ENTRYPOINT []
CMD ["node", "/usr/local/bin/n8n"]
