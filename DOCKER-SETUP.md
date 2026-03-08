# 🐳 Docker Setup Guide - n8n

## Quick Start dengan Docker

### 1. Install Docker
```bash
# macOS: Download Docker Desktop
# https://www.docker.com/products/docker-desktop

# Atau via Homebrew
brew install --cask docker
```

### 2. Start n8n
```bash
# Di folder project
docker-compose up -d

# Check status
docker-compose ps

# View logs
docker-compose logs -f n8n
```

### 3. Access n8n
- URL: `http://localhost:5678`
- Username: `admin`
- Password: `changeme123` (GANTI INI!)

### 4. Stop n8n
```bash
docker-compose down

# Stop + hapus data (hati-hati!)
docker-compose down -v
```

---

## 🔐 Security (PENTING!)

### Ganti Password Default:
Edit `docker-compose.yml`:
```yaml
- N8N_BASIC_AUTH_USER=your_username
- N8N_BASIC_AUTH_PASSWORD=your_strong_password
```

Restart:
```bash
docker-compose down
docker-compose up -d
```

---

## 💾 Backup & Restore

### Backup Data:
```bash
# Backup volume
docker run --rm -v zharation_n8n_data:/data -v $(pwd):/backup alpine tar czf /backup/n8n-backup.tar.gz -C /data .

# Atau copy workflows
docker cp n8n:/home/node/.n8n ./n8n-backup
```

### Restore Data:
```bash
# Restore dari backup
docker run --rm -v zharation_n8n_data:/data -v $(pwd):/backup alpine tar xzf /backup/n8n-backup.tar.gz -C /data
```

---

## 🚀 Production Setup (Untuk Client)

### docker-compose.prod.yml:
```yaml
version: '3.8'

services:
  n8n:
    image: n8nio/n8n:latest
    container_name: n8n-prod
    restart: always
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=${N8N_USER}
      - N8N_BASIC_AUTH_PASSWORD=${N8N_PASSWORD}
      - N8N_HOST=${N8N_HOST}
      - N8N_PORT=5678
      - N8N_PROTOCOL=https
      - NODE_ENV=production
      - WEBHOOK_URL=https://${N8N_HOST}/
      - GENERIC_TIMEZONE=Asia/Jakarta
      - EXECUTIONS_DATA_PRUNE=true
      - EXECUTIONS_DATA_MAX_AGE=168
    volumes:
      - n8n_data:/home/node/.n8n
    networks:
      - n8n-network

  # Optional: Nginx reverse proxy
  nginx:
    image: nginx:alpine
    container_name: n8n-nginx
    restart: always
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
      - ./ssl:/etc/nginx/ssl:ro
    depends_on:
      - n8n
    networks:
      - n8n-network

volumes:
  n8n_data:

networks:
  n8n-network:
    driver: bridge
```

### .env file:
```bash
N8N_USER=admin
N8N_PASSWORD=super_secure_password_here
N8N_HOST=yourdomain.com
```

---

## 🔧 Troubleshooting

### Container tidak start:
```bash
# Check logs
docker-compose logs n8n

# Restart
docker-compose restart n8n
```

### Port sudah dipakai:
Edit `docker-compose.yml`, ganti port:
```yaml
ports:
  - "8080:5678"  # Akses via localhost:8080
```

### Data hilang setelah restart:
Pastikan volume configured:
```bash
docker volume ls | grep n8n
```

---

## 📊 Monitoring

### Check resource usage:
```bash
docker stats n8n
```

### Check disk usage:
```bash
docker system df
```

### Clean up:
```bash
# Remove unused images
docker image prune -a

# Remove unused volumes (hati-hati!)
docker volume prune
```

---

## ⚡ Tips

1. **Always use volumes** untuk data persistence
2. **Backup regularly** sebelum update
3. **Monitor logs** untuk error
4. **Update n8n** secara berkala:
   ```bash
   docker-compose pull
   docker-compose up -d
   ```

---

## 🆚 Docker vs npx

| Feature | Docker | npx |
|---------|--------|-----|
| Setup | Sedikit lebih kompleks | Super simple |
| Isolation | ✅ Isolated | ❌ Global |
| Production | ✅ Ready | ⚠️ Not recommended |
| Backup | ✅ Easy | ⚠️ Manual |
| Updates | ✅ Easy | ✅ Easy |
| Resource | Sedikit lebih berat | Lebih ringan |

**Recommendation:**
- **Development/Testing:** npx (cepat!)
- **Production/Client:** Docker (stable!)

---

**Happy Dockering! 🐳**
