FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Environment variables (will be overridden by Railway)
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_HOST=0.0.0.0
ENV WEBHOOK_URL=https://your-app.railway.app
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=password123
ENV TZ=Asia/Jakarta
ENV NODE_TLS_REJECT_UNAUTHORIZED=0

# Expose port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
