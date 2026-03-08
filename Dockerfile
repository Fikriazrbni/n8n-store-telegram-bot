FROM n8nio/n8n:latest

# Expose port
EXPOSE 8080

# Start n8n
CMD ["tini", "--", "/docker-entrypoint.sh", "n8n"]
