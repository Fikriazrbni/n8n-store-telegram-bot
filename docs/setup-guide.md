# Setup Guide - n8n Workflows untuk AutoToko

## 📋 Prerequisites

Sebelum mulai, pastikan Anda sudah punya:

### 1. n8n Installation
```bash
# Opsi 1: Via npx (paling simple)
npx n8n

# Opsi 2: Via Docker
docker run -it --rm --name n8n -p 5678:5678 -v ~/.n8n:/home/node/.n8n n8nio/n8n

# Opsi 3: Via npm global
npm install n8n -g
n8n
```

Akses n8n di: `http://localhost:5678`

### 2. Accounts & API Keys

#### WhatsApp Business API
**Opsi A: Fonnte (Recommended untuk pemula)**
- Daftar di: https://fonnte.com
- Harga: ~Rp 50.000/bulan
- Dapat API token

**Opsi B: Wablas**
- Daftar di: https://wablas.com
- Harga: ~Rp 75.000/bulan
- Dapat API token

**Opsi C: WhatsApp Business API Official**
- Via Meta Business
- Lebih kompleks, butuh verifikasi
- Gratis tapi butuh setup

#### Telegram Bot
1. Buka Telegram, cari `@BotFather`
2. Kirim `/newbot`
3. Ikuti instruksi
4. Simpan Bot Token
5. Untuk dapat Chat ID:
   - Kirim message ke bot Anda
   - Buka: `https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates`
   - Cari `"chat":{"id":XXXXXXX}`

#### Google Sheets
1. Buat Google Sheet baru
2. Buat sheets: `Orders`, `Invoices`, `Inventory`
3. Di n8n, setup Google Sheets OAuth2 credential

---

## 🚀 Setup Workflows

### STEP 1: Import Workflows

1. Buka n8n (`http://localhost:5678`)
2. Klik menu (☰) → **Import from File**
3. Upload file JSON dari folder `workflows/`:
   - `1-starter-package.json`
   - `2-growth-package.json`
   - `3-pro-package.json`
4. Atau copy-paste JSON content

### STEP 2: Configure Credentials

#### A. WhatsApp API (Fonnte)

1. Di workflow, klik node WhatsApp
2. Klik **Create New Credential**
3. Pilih **HTTP Request** → **Header Auth**
4. Isi:
   ```
   Name: WhatsApp API
   Header Name: Authorization
   Header Value: YOUR_FONNTE_TOKEN
   ```

**Endpoint Fonnte:**
- Send Message: `https://api.fonnte.com/send`
- Body format:
  ```json
  {
    "target": "628123456789",
    "message": "Your message",
    "countryCode": "62"
  }
  ```

#### B. Telegram Bot

1. Klik node Telegram
2. **Create New Credential**
3. Pilih **Telegram API**
4. Isi:
   ```
   Access Token: YOUR_BOT_TOKEN
   ```
5. Di node, isi Chat ID: `YOUR_CHAT_ID`

#### C. Google Sheets

1. Klik node Google Sheets
2. **Create New Credential**
3. Pilih **Google Sheets OAuth2 API**
4. Klik **Connect my account**
5. Login dengan Google Account
6. Authorize n8n
7. Pilih Spreadsheet ID Anda

### STEP 3: Setup Google Sheets Structure

#### Sheet: Orders
| Column | Type | Description |
|--------|------|-------------|
| order_id | Text | ORD-YYYYMMDDHHMMSS |
| channel | Text | whatsapp/instagram/telegram |
| date | Date | YYYY-MM-DD |
| customer_name | Text | Nama customer |
| customer_contact | Text | Phone/username |
| items | Text | Deskripsi items |
| total | Number | Total harga |
| status | Text | pending/paid/shipped/done |

#### Sheet: Invoices
| Column | Type | Description |
|--------|------|-------------|
| invoice_number | Text | INV-YYYYMMDD-XXX |
| date | Date | DD/MM/YYYY |
| customer_name | Text | Nama customer |
| customer_phone | Text | Phone number |
| items | Text | Deskripsi items |
| total | Number | Total harga |
| status | Text | unpaid/paid |

#### Sheet: Inventory
| Column | Type | Description |
|--------|------|-------------|
| product_id | Text | SKU/ID produk |
| product_name | Text | Nama produk |
| stock | Number | Jumlah stok saat ini |
| min_stock | Number | Minimum stok (untuk alert) |
| price | Number | Harga satuan |
| last_updated | Date | Terakhir update |

### STEP 4: Customize Messages

Edit message templates di workflow sesuai brand Anda:

**Auto-Reply Message:**
```
Terima kasih sudah menghubungi [NAMA TOKO]! 

Ada yang bisa kami bantu? 😊

Jam operasional:
Senin-Jumat: 09.00-18.00
Sabtu: 09.00-15.00

Fast response: ketik "order" untuk pesan
```

**Order Confirmation:**
```
🎉 Terima kasih sudah order di [NAMA TOKO]!

Order ID: {{orderId}}
Total: Rp {{total}}

Kami akan proses segera. Mohon tunggu invoice ya! 🙏
```

**Invoice Message:**
```
📄 Invoice untuk order Anda

Invoice: {{invoiceNumber}}
Total: Rp {{total}}

Silakan transfer ke:
Bank: [NAMA BANK]
No. Rek: [NOMOR REKENING]
a.n. [NAMA PEMILIK]

Konfirmasi setelah transfer ya! 
Terima kasih 🙏
```

### STEP 5: Test Workflows

#### Test Starter Package:
1. Activate workflow
2. Kirim message WhatsApp ke nomor bisnis Anda
3. Cek:
   - ✅ Auto-reply diterima?
   - ✅ Notif masuk ke Telegram?
   - ✅ Data tersimpan di Google Sheets?

#### Test Growth Package:
1. Trigger webhook dengan data order
2. Cek:
   - ✅ Invoice PDF generated?
   - ✅ Invoice terkirim ke customer?
   - ✅ Admin dapat notif?
   - ✅ Data tersimpan?

#### Test Pro Package:
1. Test multi-channel order
2. Cek daily report (ubah schedule untuk testing)
3. Verify analytics calculation

---

## 🔧 Troubleshooting

### Problem: Webhook tidak menerima data
**Solution:**
- Pastikan workflow active
- Cek webhook URL: `http://YOUR_N8N_URL/webhook/[path]`
- Jika local, gunakan ngrok untuk expose:
  ```bash
  ngrok http 5678
  ```

### Problem: WhatsApp message tidak terkirim
**Solution:**
- Cek API token masih valid
- Cek format phone number (62xxx tanpa +)
- Cek quota API (Fonnte/Wablas)
- Lihat error di n8n execution log

### Problem: Google Sheets tidak update
**Solution:**
- Re-authenticate Google credential
- Cek permission Google Sheet (edit access)
- Cek Sheet name spelling (case-sensitive)

### Problem: Telegram notif tidak masuk
**Solution:**
- Cek Bot Token valid
- Cek Chat ID benar
- Start conversation dengan bot dulu (kirim /start)

### Problem: Invoice PDF tidak generate
**Solution:**
- Install dependencies jika self-hosted:
  ```bash
  npm install puppeteer
  ```
- Atau gunakan alternative: generate HTML dan kirim link

---

## 📊 Monitoring & Maintenance

### Daily Checks:
- [ ] Cek execution log di n8n
- [ ] Verify notifikasi masuk
- [ ] Cek Google Sheets data integrity

### Weekly Checks:
- [ ] Review error logs
- [ ] Check API quota usage
- [ ] Backup Google Sheets data

### Monthly Checks:
- [ ] Review workflow performance
- [ ] Optimize slow nodes
- [ ] Update credentials jika expired
- [ ] Archive old data

---

## 🎯 Optimization Tips

### 1. Performance
- Gunakan batch processing untuk volume tinggi
- Set execution timeout yang reasonable
- Archive old data regularly

### 2. Reliability
- Setup error notifications
- Implement retry logic
- Have backup workflows

### 3. Security
- Jangan hardcode credentials
- Gunakan environment variables
- Regular credential rotation
- Backup workflows regularly

### 4. Scalability
- Monitor execution time
- Optimize database queries
- Consider queue system untuk high volume

---

## 📞 Support

Jika ada masalah:

1. **Check Documentation** - Baca guide ini dulu
2. **Check n8n Docs** - https://docs.n8n.io
3. **Check Execution Logs** - Lihat error message di n8n
4. **Contact Support** - WhatsApp/Telegram kami

**Support Hours:**
- Senin-Jumat: 09.00-18.00 WIB
- Sabtu: 09.00-15.00 WIB
- Emergency: 24/7 (untuk Pro package)

---

## 📚 Additional Resources

- n8n Documentation: https://docs.n8n.io
- n8n Community: https://community.n8n.io
- Fonnte Docs: https://docs.fonnte.com
- Telegram Bot API: https://core.telegram.org/bots/api
- Google Sheets API: https://developers.google.com/sheets/api

---

**Happy Automating! 🚀**

Jika ada pertanyaan, jangan ragu untuk hubungi kami!
