# 🚀 Getting Started

## Jawaban Cepat:

### ❓ Butuh .venv?
**TIDAK!** n8n adalah Node.js app, bukan Python. Tidak perlu virtual environment.

### ❓ Docker atau npx?
**Tergantung kebutuhan:**

| Use Case | Recommendation |
|----------|----------------|
| Testing/Belajar | `npx n8n` (paling cepat!) |
| Development | `npx n8n` atau Docker |
| Production/Client | **Docker** (recommended!) |

---

## 🎯 Quick Start

### Untuk Testing (5 detik):
```bash
npx n8n
```
Buka: `http://localhost:5678`

### Untuk Production (1 menit):
```bash
# 1. Install Docker Desktop
# https://www.docker.com/products/docker-desktop

# 2. Start n8n
docker-compose up -d

# 3. Access
# http://localhost:5678
# Username: admin
# Password: changeme123 (GANTI!)
```

---

## 📚 Documentation

1. **[QUICK-START.md](QUICK-START.md)** - Panduan lengkap 5 langkah
2. **[DOCKER-SETUP.md](DOCKER-SETUP.md)** - Docker setup detail
3. **[PROJECT-OVERVIEW.md](PROJECT-OVERVIEW.md)** - Big picture

---

## 🐳 Why Docker?

**Advantages:**
- ✅ Isolated environment
- ✅ Easy backup & restore
- ✅ Production-ready
- ✅ Consistent across machines
- ✅ Easy updates

**Disadvantages:**
- ⚠️ Butuh install Docker
- ⚠️ Sedikit lebih kompleks
- ⚠️ Resource usage lebih besar

---

## 💡 Recommendation

**Untuk Anda (Development):**
1. Start dengan `npx n8n` untuk testing cepat
2. Kalau sudah OK, migrate ke Docker
3. Gunakan Docker untuk deploy ke client

**Untuk Client (Production):**
- Always use Docker
- Setup di VPS/cloud
- Enable HTTPS
- Regular backup

---

## 🆘 Need Help?

- Docker issues: Baca [DOCKER-SETUP.md](DOCKER-SETUP.md)
- General setup: Baca [QUICK-START.md](QUICK-START.md)
- n8n docs: https://docs.n8n.io

---

**Happy Automating! 🚀**
