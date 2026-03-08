# n8n Workflows - AutoToko

## 📦 Daftar Workflows

### 🎯 0. DEMO Package (MULAI DARI SINI!) - GRATIS!
**File:** `0-demo-free.json`

**Fitur:**
- ✅ Schedule automation (every 5 minutes)
- ✅ Google Sheets integration (GRATIS!)
- ✅ Telegram notifications (GRATIS!)
- ✅ Webhook testing
- ✅ Public API integration
- ✅ JavaScript code processing

**Yang Dibutuhkan:**
- ✅ Google Account (gratis)
- ✅ Telegram Bot (gratis)
- ❌ TIDAK perlu WhatsApp API berbayar!

**Use Case:**
- Belajar n8n automation
- Test workflows tanpa biaya
- Prototype automation ideas

**Panduan:** Baca [DEMO-GUIDE.md](DEMO-GUIDE.md)

---

### 1. Starter Package
**File:** `1-starter-package.json`

**Fitur:**
- ✅ Auto-reply WhatsApp 24/7
- ✅ Deteksi kata kunci "order"
- ✅ Simpan order ke Google Sheets
- ✅ Notifikasi ke admin via Telegram

**Use Case:**
Cocok untuk toko online pemula yang butuh automation dasar untuk handle customer chat dan order tracking.

---

### 2. Growth Package
**File:** `2-growth-package.json`

**Fitur:**
- ✅ Semua fitur Starter
- ✅ Invoice generator otomatis (PDF)
- ✅ Kirim invoice via WhatsApp
- ✅ Alert stok rendah (cek setiap 6 jam)
- ✅ Inventory management

**Use Case:**
Untuk toko online yang sudah berkembang dan butuh professional invoice + inventory tracking.

---

### 3. Pro Package
**File:** `3-pro-package.json`

**Fitur:**
- ✅ Semua fitur Growth
- ✅ Multi-channel (WhatsApp, Instagram, Telegram)
- ✅ Laporan harian otomatis (jam 8 malam)
- ✅ Laporan bulanan (tanggal 1)
- ✅ Analytics dashboard

**Use Case:**
Untuk toko online established yang jualan di multiple channel dan butuh analytics mendalam.

---

## 🚀 Cara Import

### Method 1: Via File Upload
1. Buka n8n (`http://localhost:5678`)
2. Klik menu (☰) di kiri atas
3. Pilih **"Import from File"**
4. Upload file JSON
5. Klik **"Import"**

### Method 2: Via Copy-Paste
1. Buka file JSON di text editor
2. Copy semua content (Cmd/Ctrl + A, Cmd/Ctrl + C)
3. Di n8n, klik menu → **"Import from URL"**
4. Paste JSON content
5. Klik **"Import"**

---

## ⚙️ Configuration Required

Setelah import, Anda perlu configure:

### 1. WhatsApp API Credential
- Node: "Balas Pesan Order", "Kirim Balasan Umum"
- Type: HTTP Request
- Method: POST
- URL: `https://api.fonnte.com/send` (atau provider lain)
- Headers:
  ```
  Authorization: YOUR_FONNTE_TOKEN
  ```
- Body:
  ```json
  {
    "target": "={{$json.phone}}",
    "message": "={{$json.message}}",
    "countryCode": "62"
  }
  ```

### 2. Telegram Bot Credential
- Node: "Notif ke Admin", "Alert Stok Rendah", dll
- Type: Telegram API
- Access Token: `YOUR_BOT_TOKEN`
- Chat ID: `YOUR_CHAT_ID`

### 3. Google Sheets Credential
- Node: "Simpan ke Google Sheets", "Baca Data Orders", dll
- Type: Google Sheets OAuth2 API
- Klik "Connect my account"
- Login & authorize
- Pilih Spreadsheet

### 4. Spreadsheet ID
Di setiap Google Sheets node, isi:
- **Spreadsheet ID:** Ambil dari URL Google Sheets
  ```
  https://docs.google.com/spreadsheets/d/SPREADSHEET_ID/edit
  ```
- **Sheet Name:** Orders / Invoices / Inventory

---

## 📊 Google Sheets Setup

Buat Google Sheet dengan struktur berikut:

### Sheet: Orders
```
| order_id | channel | date | customer_name | customer_contact | items | total | status |
```

### Sheet: Invoices
```
| invoice_number | date | customer_name | customer_phone | items | total | status |
```

### Sheet: Inventory
```
| product_id | product_name | stock | min_stock | price | last_updated |
```

**Template:** Copy dari [link Google Sheets template]

---

## 🎨 Customization

### Ubah Message Templates

**Auto-Reply Message:**
Edit di node "Auto Reply Umum" → Set node:
```
Terima kasih sudah menghubungi [NAMA TOKO ANDA]! 

Ada yang bisa kami bantu? 😊

Jam operasional:
Senin-Jumat: 09.00-18.00
Sabtu: 09.00-15.00

Ketik "order" untuk pesan
Ketik "harga" untuk info harga
```

**Order Confirmation:**
Edit di node "Balas Pesan Order":
```
🎉 Terima kasih sudah order di [NAMA TOKO]!

Order ID: {{$json.timestamp.slice(0,10)}}
Pesanan: {{$json.message}}

Tim kami akan segera proses. 
Mohon tunggu konfirmasi ya! 🙏

Info: www.tokosaya.com
```

**Invoice Template:**
Edit di node "Generate Invoice HTML" untuk customize:
- Logo toko
- Warna brand
- Info kontak
- Info pembayaran

### Ubah Schedule

**Inventory Check:**
Default: Setiap 6 jam
Edit di node "Schedule: Cek Stok":
- Hourly: `0 */6 * * *`
- Daily: `0 9 * * *` (jam 9 pagi)
- Custom: Sesuaikan cron expression

**Daily Report:**
Default: Jam 8 malam
Edit di node "Schedule: Daily Report":
- `0 20 * * *` → jam 8 malam
- `0 9 * * *` → jam 9 pagi
- `0 12 * * *` → jam 12 siang

**Monthly Report:**
Default: Tanggal 1 jam 9 pagi
Edit di node "Schedule: Monthly Report":
- `0 9 1 * *` → tanggal 1 jam 9 pagi
- `0 9 * * 1` → setiap Senin jam 9 pagi

---

## 🧪 Testing

### Test Starter Package:

1. **Activate Workflow:**
   - Toggle switch di kanan atas → ON

2. **Test Auto-Reply:**
   - Kirim message ke WhatsApp bisnis: "Halo"
   - Expected: Dapat auto-reply
   - Cek: Telegram dapat notif?

3. **Test Order Detection:**
   - Kirim message: "Mau order 2 baju"
   - Expected: Dapat reply khusus order
   - Cek: Data masuk Google Sheets?

4. **Check Execution:**
   - Di n8n, klik "Executions" (kanan atas)
   - Lihat log execution
   - Pastikan semua node success (hijau)

### Test Growth Package:

1. **Test Invoice Generator:**
   - Trigger webhook dengan data:
     ```bash
     curl -X POST http://localhost:5678/webhook/order-confirmed \
       -H "Content-Type: application/json" \
       -d '{
         "customer_name": "Test Customer",
         "customer_phone": "628123456789",
         "items": "2x Baju Merah",
         "total": "200000"
       }'
     ```
   - Expected: Invoice PDF generated & sent

2. **Test Inventory Alert:**
   - Di Google Sheets Inventory, set stock < min_stock
   - Wait for schedule atau trigger manual
   - Expected: Dapat alert di Telegram

### Test Pro Package:

1. **Test Multi-Channel:**
   - Send order dari berbagai channel
   - Expected: Semua masuk ke database

2. **Test Daily Report:**
   - Ubah schedule ke waktu dekat
   - Wait atau trigger manual
   - Expected: Dapat laporan di Telegram

---

## 🐛 Troubleshooting

### Error: "Webhook not found"
**Cause:** Workflow belum active
**Fix:** Toggle workflow ON

### Error: "Authentication failed"
**Cause:** Credential salah/expired
**Fix:** Re-configure credential

### Error: "Sheet not found"
**Cause:** Sheet name salah
**Fix:** Cek spelling, case-sensitive

### Error: "Phone number invalid"
**Cause:** Format nomor salah
**Fix:** Gunakan format 628xxx (tanpa +)

### Error: "Telegram bot not responding"
**Cause:** Bot belum di-start
**Fix:** Kirim /start ke bot dulu

### Workflow tidak jalan otomatis
**Cause:** Schedule/webhook issue
**Fix:** 
- Cek workflow active
- Cek schedule cron expression
- Cek webhook URL accessible

---

## 📈 Monitoring

### Daily:
- [ ] Cek execution log
- [ ] Verify notifikasi masuk
- [ ] Spot check Google Sheets data

### Weekly:
- [ ] Review error rate
- [ ] Check API quota
- [ ] Backup data

### Monthly:
- [ ] Performance review
- [ ] Optimization opportunities
- [ ] Update credentials if needed

---

## 🔒 Security Best Practices

1. **Credentials:**
   - Jangan share credential
   - Rotate API keys regularly
   - Use environment variables

2. **Data:**
   - Backup Google Sheets weekly
   - Limit access to authorized users only
   - Encrypt sensitive data

3. **Webhooks:**
   - Use HTTPS (not HTTP)
   - Implement webhook signature verification
   - Rate limiting

4. **n8n Instance:**
   - Use strong password
   - Enable 2FA if possible
   - Keep n8n updated

---

## 🆘 Support

Butuh bantuan?

1. **Documentation:** Baca `docs/setup-guide.md`
2. **n8n Docs:** https://docs.n8n.io
3. **Community:** https://community.n8n.io
4. **Contact Us:**
   - WhatsApp: +62 812-3456-7890
   - Email: hello@autotoko.id
   - Telegram: @autotoko

---

## 📝 Changelog

### v1.0 (2024)
- Initial release
- 3 workflow packages
- Basic automation features

---

## 📄 License

These workflows are provided as part of AutoToko service.
For commercial use, please contact us.

---

**Happy Automating! 🚀**
