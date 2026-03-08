# 🚀 Deploy n8n ke Render.com (100% GRATIS!)

## ✅ Keuntungan Render.com:
- 💰 **100% Gratis** (no credit card!)
- 🌐 **HTTPS otomatis**
- 🔄 **Auto-deploy dari GitHub**
- ⚡ **750 jam/bulan** (cukup untuk testing)
- ⚠️ **Sleep after 15 min inactive** (wake up 30 detik)

---

## 📋 Prerequisites:

1. ✅ GitHub account
2. ✅ Render.com account (daftar gratis)
3. ✅ Code sudah di-push ke GitHub

---

## 🎯 Step-by-Step Deploy (10 Menit):

### Step 1: Buat Render Account

1. Buka: https://render.com
2. Klik **"Get Started"**
3. Sign up dengan **GitHub** (recommended)
4. Authorize Render

---

### Step 2: Buat Web Service

1. Di dashboard Render, klik **"New +"**
2. Pilih **"Web Service"**
3. Klik **"Connect a repository"**
4. Pilih repo: `telegram-store-bot`
5. Klik **"Connect"**

---

### Step 3: Configure Service

**Basic Settings:**
- **Name:** `telegram-store-bot` (atau terserah)
- **Region:** Singapore (paling dekat)
- **Branch:** `main`
- **Runtime:** Docker
- **Instance Type:** Free

**Build & Deploy:**
- **Docker Command:** (kosongkan, auto-detect dari docker-compose.yml)

**Environment Variables:**
Klik **"Add Environment Variable"**, tambahkan:

```
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=password123
N8N_HOST=0.0.0.0
N8N_PORT=5678
N8N_PROTOCOL=https
WEBHOOK_URL=https://telegram-store-bot.onrender.com
TZ=Asia/Jakarta
NODE_TLS_REJECT_UNAUTHORIZED=0
```

**⚠️ PENTING:** Ganti `telegram-store-bot` dengan nama service kamu!

---

### Step 4: Deploy!

1. Scroll ke bawah
2. Klik **"Create Web Service"**
3. Tunggu 5-10 menit (first deploy)
4. Status jadi **"Live"** → ✅ Success!

---

### Step 5: Akses n8n

1. Copy URL: `https://telegram-store-bot.onrender.com`
2. Buka di browser
3. Login:
   - Username: `admin`
   - Password: `password123`

---

### Step 6: Import Workflow

1. Di n8n, klik menu (☰)
2. **"Import from File"**
3. Upload: `4-telegram-store-bot.json`
4. Klik **"Import"**

---

### Step 7: Setup Credentials

#### A. Google Sheets OAuth2

1. Klik node **"Get Products"**
2. Klik **"Create New Credential"**
3. Pilih **"Google Sheets OAuth2 API"**
4. Isi:
   - **Client ID:** (dari Google Cloud Console)
   - **Client Secret:** (dari Google Cloud Console)
   - **Authorized Redirect URI:** `https://telegram-store-bot.onrender.com/rest/oauth2-credential/callback`
5. Klik **"Connect my account"**
6. Login & authorize
7. Pilih Spreadsheet ID: `1EQqpvCrbquC5OV7iGTxrISdQeWcQxHKZtigzIzrIKV4`

#### B. Telegram Bot

1. Klik node **"Send Invoice"**
2. Klik **"Create New Credential"**
3. Pilih **"Telegram API"**
4. Isi Access Token: `8614969102:AAH6hUBycXob7qVZ5h9yGDAtJNqb3-Tijlo`
5. Save

---

### Step 8: Ganti Manual Trigger → Telegram Trigger

**PENTING:** Sekarang kita pakai Telegram Trigger (real-time)!

1. **Delete** node "Manual Trigger" & "Simulate Message"
2. **Add node** → Search "Telegram Trigger"
3. Configure:
   - **Credential:** Pilih Telegram API yang tadi
   - **Updates:** Message
4. **Connect** ke node "Check Order Command"
5. **Save** workflow

---

### Step 9: Set Telegram Webhook

Di terminal, jalankan:

```bash
curl "https://api.telegram.org/bot8614969102:AAH6hUBycXob7qVZ5h9yGDAtJNqb3-Tijlo/setWebhook?url=https://telegram-store-bot.onrender.com/webhook-test/telegram"
```

**Response:**
```json
{"ok":true,"result":true,"description":"Webhook was set"}
```

---

### Step 10: Activate Workflow

1. Toggle workflow → **ON**
2. Klik **"Save"** (PENTING!)

---

### Step 11: Test Bot! 🎉

1. Buka Telegram
2. Cari bot kamu
3. Kirim: `/order Kopi Susu-2, Teh Manis-1`
4. Bot harusnya reply dengan invoice! 🎯

---

## ⚠️ Render Free Tier Limitations:

### Sleep Mode:
- Bot **sleep** setelah 15 menit tidak ada traffic
- **Wake up** butuh 30 detik saat ada request pertama
- User pertama akan tunggu 30 detik, user berikutnya instant

### Solusi:
1. **Upgrade ke Paid** ($7/bulan) → no sleep
2. **Pakai cron job** untuk ping setiap 10 menit (keep alive)
3. **Accept limitation** (untuk testing OK)

---

## 🔧 Troubleshooting:

### Bot tidak respond?

**Check 1: Workflow Active?**
- Pastikan toggle ON
- Pastikan sudah di-save

**Check 2: Webhook Set?**
```bash
curl "https://api.telegram.org/bot<TOKEN>/getWebhookInfo"
```

**Check 3: Render Logs**
- Di Render dashboard → Logs
- Cek ada error?

**Check 4: Service Sleep?**
- Kirim message lagi
- Tunggu 30 detik
- Coba lagi

### Google Sheets Error?

**Re-authenticate:**
1. Klik credential
2. Klik "Reconnect"
3. Login lagi

### Telegram Trigger Error?

**Webhook URL salah:**
- Pastikan format: `https://YOUR-APP.onrender.com/webhook-test/telegram`
- Ganti `YOUR-APP` dengan nama service kamu

---

## 🎯 Keep Alive (Optional):

Supaya bot tidak sleep, pakai cron job gratis:

### Option 1: UptimeRobot (Recommended)
1. Daftar: https://uptimerobot.com (gratis)
2. Add Monitor:
   - Type: HTTP(s)
   - URL: `https://telegram-store-bot.onrender.com`
   - Interval: 5 minutes
3. Done! Bot tidak akan sleep

### Option 2: Cron-job.org
1. Daftar: https://cron-job.org (gratis)
2. Create cronjob:
   - URL: `https://telegram-store-bot.onrender.com`
   - Interval: Every 10 minutes
3. Done!

---

## 💰 Upgrade ke Paid (Optional):

Kalau bot sudah banyak user, upgrade:

**Render Starter Plan:**
- **Cost:** $7/bulan (~Rp 110k)
- **No sleep**
- **Better performance**
- **More resources**

---

## 🎉 Selamat! Bot Sudah LIVE 24/7!

Sekarang bot bisa diakses siapa saja di Telegram! 🚀

**Next Steps:**
1. Share bot ke teman/customer
2. Monitor logs & performance
3. Optimize workflow
4. Collect feedback
5. Iterate & improve!

---

## 📞 Need Help?

- Render Docs: https://render.com/docs
- n8n Docs: https://docs.n8n.io
- Telegram Bot API: https://core.telegram.org/bots/api

---

**Happy Deploying! 🎉**
