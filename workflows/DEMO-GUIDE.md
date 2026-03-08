# 🎯 Demo Workflow - 100% GRATIS!

## Workflow yang Bisa Dicoba TANPA Biaya

### ✅ 0-demo-free.json (MULAI DARI SINI!)

**Fitur:**
- ⏰ Schedule trigger (jalan otomatis setiap 5 menit)
- 📊 Save data ke Google Sheets (GRATIS!)
- 📱 Telegram notification (GRATIS!)
- 🌐 Webhook (test dengan curl)
- 🔄 Fetch public API (GRATIS!)
- 💻 JavaScript code processing

**Yang Dibutuhkan:**
1. ✅ Google Account (gratis)
2. ✅ Telegram Bot (gratis)
3. ❌ TIDAK perlu WhatsApp API berbayar!

---

## 🚀 Quick Start (5 Menit)

### Step 1: Setup Telegram Bot (GRATIS!)

```
1. Buka Telegram, cari: @BotFather
2. Kirim: /newbot
3. Ikuti instruksi
4. Copy Bot Token (contoh: 123456:ABC-DEF...)
5. Kirim message ke bot Anda
6. Buka: https://api.telegram.org/bot<TOKEN>/getUpdates
7. Copy Chat ID (contoh: 123456789)
```

### Step 2: Setup Google Sheets (GRATIS!)

```
1. Buka Google Sheets
2. Buat sheet baru
3. Rename Sheet1 (atau biarkan default)
4. Buat 3 kolom: timestamp | message | random_number
5. Copy Spreadsheet ID dari URL
```

### Step 3: Import Workflow

```
1. Buka n8n: http://localhost:5678
2. Klik "Add workflow"
3. Klik menu (☰) → "Import from File"
4. Upload: workflows/0-demo-free.json
5. Klik "Import"
```

### Step 4: Configure

#### A. Google Sheets:
```
1. Klik node "Save to Google Sheets"
2. Klik "Create New Credential"
3. Pilih "Google Sheets OAuth2 API"
4. Klik "Connect my account"
5. Login & authorize
6. Pilih Spreadsheet ID Anda
```

#### B. Telegram:
```
1. Klik node "Send Telegram Notification"
2. Edit URL, ganti:
   - {{$env.TELEGRAM_BOT_TOKEN}} → Bot Token Anda
   - {{$env.TELEGRAM_CHAT_ID}} → Chat ID Anda
```

### Step 5: Test!

#### Test 1: Schedule (Auto)
```
1. Activate workflow (toggle ON)
2. Tunggu 5 menit
3. Cek Google Sheets → ada data baru?
4. Cek Telegram → dapat notif?
```

#### Test 2: Webhook (Manual)
```bash
# Di terminal, jalankan:
curl -X POST http://localhost:5678/webhook/demo-webhook \
  -H "Content-Type: application/json" \
  -d '{"test": "hello from curl"}'

# Harusnya dapat response:
# {"status": "success", "message": "Data received!", ...}
```

#### Test 3: Public API
```
1. Klik node "Fetch Public API (Free)"
2. Klik "Execute Node"
3. Lihat hasilnya!
```

---

## 🎓 Apa yang Bisa Dipelajari?

### 1. **Schedule Trigger**
- Jalan otomatis setiap X menit/jam/hari
- Cron expression
- Use case: daily report, monitoring, backup

### 2. **Google Sheets Integration**
- Save data otomatis
- Read data
- Update data
- Use case: database sederhana, logging

### 3. **Telegram Bot**
- Send notification
- Send message
- Use case: alert, report, monitoring

### 4. **Webhook**
- Receive data dari external
- Process & respond
- Use case: integrate dengan app lain

### 5. **HTTP Request**
- Fetch data dari API
- POST data
- Use case: integrate dengan service lain

### 6. **Code Node**
- JavaScript processing
- Data transformation
- Custom logic

### 7. **IF Condition**
- Branching logic
- Decision making
- Use case: filter, routing

---

## 💡 Modifikasi Ideas (Masih Gratis!)

### Idea 1: Daily Weather Report
```
1. Fetch weather API (gratis: openweathermap.org)
2. Save ke Google Sheets
3. Send summary via Telegram
```

### Idea 2: RSS to Telegram
```
1. RSS Trigger (blog/news)
2. Filter artikel baru
3. Send ke Telegram
```

### Idea 3: GitHub Monitor
```
1. GitHub Trigger (new issue/PR)
2. Format message
3. Send ke Telegram
```

### Idea 4: Simple Task Manager
```
1. Webhook receive task
2. Save ke Google Sheets
3. Send confirmation via Telegram
```

---

## 🆚 Comparison: Demo vs Paid Workflows

| Feature | Demo (Free) | Starter/Growth/Pro |
|---------|-------------|-------------------|
| Cost | Rp 0 | Rp 50k/bulan (WA API) |
| Telegram | ✅ | ✅ |
| Google Sheets | ✅ | ✅ |
| WhatsApp | ❌ | ✅ |
| Schedule | ✅ | ✅ |
| Webhook | ✅ | ✅ |
| Invoice PDF | ❌ | ✅ (Growth+) |
| Multi-channel | ❌ | ✅ (Pro) |

---

## 🎯 Setelah Demo, Mau Upgrade?

Kalau sudah paham konsepnya, baru upgrade ke workflow berbayar:

**Step 1: Daftar WhatsApp API**
- Fonnte: https://fonnte.com (~Rp 50k/bulan)
- Wablas: https://wablas.com (~Rp 75k/bulan)

**Step 2: Import Workflow Berbayar**
- 1-starter-package.json (Rp 1jt untuk client)
- 2-growth-package.json (Rp 3jt untuk client)
- 3-pro-package.json (Rp 5jt untuk client)

---

## 🆘 Troubleshooting

### Telegram tidak dapat notif?
```
- Pastikan Bot Token benar
- Pastikan Chat ID benar
- Kirim /start ke bot dulu
```

### Google Sheets error?
```
- Re-authenticate credential
- Pastikan Spreadsheet ID benar
- Pastikan Sheet name benar (case-sensitive)
```

### Webhook tidak jalan?
```
- Pastikan workflow active
- Cek URL: http://localhost:5678/webhook/demo-webhook
- Test dengan curl atau Postman
```

---

## 📚 Resources

- n8n Docs: https://docs.n8n.io
- Telegram Bot API: https://core.telegram.org/bots/api
- Google Sheets API: https://developers.google.com/sheets/api
- Free Public APIs: https://github.com/public-apis/public-apis

---

## 🎉 Ready to Test!

**Workflow ini 100% GRATIS dan bisa jalan selamanya!**

Tidak ada biaya bulanan, tidak ada trial period, tidak ada limit!

Selamat belajar automation! 🚀

---

**Questions?** Baca dokumentasi atau tanya di n8n community!
