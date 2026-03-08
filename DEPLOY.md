# 🚀 Deploy n8n Telegram Store Bot ke Railway

## 📋 Yang Di-Push ke GitHub:
- ✅ `docker-compose.yml` (config n8n)
- ✅ `workflows/*.json` (workflow files)
- ✅ `.gitignore` (ignore sensitive data)
- ✅ `README.md` (dokumentasi)
- ❌ **JANGAN:** `.n8n/` folder (credentials!)
- ❌ **JANGAN:** `.env` file (secrets!)

## 🎯 Quick Deploy (5 Menit):

### 1. Push ke GitHub
```bash
cd zharation
git init
git add docker-compose.yml workflows/ .gitignore README.md
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/USERNAME/REPO.git
git push -u origin main
```

### 2. Deploy ke Railway
1. Buka: https://railway.app
2. Login dengan GitHub
3. Klik "New Project" → "Deploy from GitHub repo"
4. Pilih repo `zharation`
5. Railway auto-detect Docker & deploy!
6. Tunggu 2-3 menit → dapat URL HTTPS

### 3. Setup Workflow di Railway
1. Buka URL Railway: `https://your-app.railway.app`
2. Login n8n (buat account baru)
3. Import workflow: `4-telegram-store-bot.json`
4. Setup credentials:
   - Google Sheets OAuth2
   - Telegram Bot Token
5. Activate workflow!

### 4. Set Telegram Webhook
```bash
curl "https://api.telegram.org/bot<BOT_TOKEN>/setWebhook?url=https://your-app.railway.app/webhook/telegram"
```

## ✅ Done! Bot sudah LIVE 24/7!

---

## 💰 Cost:
- **Railway Free Tier:** Rp 0 (500 jam/bulan)
- **Railway Hobby:** $5/bulan (unlimited)

## 🔒 Security:
- Credentials disimpan di Railway (encrypted)
- Tidak ada credentials di GitHub
- HTTPS by default

---

**Questions?** Check Railway docs: https://docs.railway.app
