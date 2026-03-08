# 🚀 Quick Start Guide - AutoToko

## Mulai dalam 5 Langkah!

### Step 1: Install n8n (5 menit)

**Pilih salah satu:**

#### Opsi A: Docker (Recommended untuk Production)
```bash
# 1. Pastikan Docker sudah installed
# Download: https://www.docker.com/products/docker-desktop

# 2. Start n8n
docker-compose up -d

# 3. Check status
docker-compose ps
```

**Detail lengkap:** Baca [DOCKER-SETUP.md](DOCKER-SETUP.md)

#### Opsi B: npx (Paling Simple untuk Testing)
```bash
npx n8n
```

#### Opsi C: Global Install
```bash
npm install n8n -g
n8n
```

**Akses:** `http://localhost:5678`

**Catatan:** 
- Untuk **testing/belajar**: pakai npx (cepat!)
- Untuk **production/client**: pakai Docker (stable!)

---

### Step 2: Setup Accounts (10 menit)

#### A. WhatsApp API - Fonnte (Recommended)
1. Daftar: https://fonnte.com
2. Scan QR dengan WhatsApp
3. Copy API Token
4. Harga: ~Rp 50k/bulan

#### B. Telegram Bot
1. Buka Telegram, cari `@BotFather`
2. Kirim: `/newbot`
3. Ikuti instruksi
4. Copy Bot Token
5. Kirim message ke bot Anda
6. Buka: `https://api.telegram.org/bot<TOKEN>/getUpdates`
7. Copy Chat ID

#### C. Google Sheets
1. Buat Google Sheet baru
2. Buat 3 sheets: `Orders`, `Invoices`, `Inventory`
3. Copy Spreadsheet ID dari URL

---

### Step 3: Import Workflow (2 menit)

1. Di n8n, klik menu (☰)
2. Pilih "Import from File"
3. Upload: `workflows/1-starter-package.json`
4. Klik "Import"

---

### Step 4: Configure (10 menit)

#### A. WhatsApp Credential
1. Klik node "Balas Pesan Order"
2. Klik "Create New Credential"
3. Pilih "HTTP Request" → "Header Auth"
4. Isi:
   - Name: `WhatsApp API`
   - Header Name: `Authorization`
   - Header Value: `YOUR_FONNTE_TOKEN`
5. Save

#### B. Telegram Credential
1. Klik node "Notif ke Admin"
2. Klik "Create New Credential"
3. Pilih "Telegram API"
4. Isi Access Token: `YOUR_BOT_TOKEN`
5. Save
6. Di node, isi Chat ID: `YOUR_CHAT_ID`

#### C. Google Sheets Credential
1. Klik node "Simpan ke Google Sheets"
2. Klik "Create New Credential"
3. Pilih "Google Sheets OAuth2 API"
4. Klik "Connect my account"
5. Login & authorize
6. Di node, isi Spreadsheet ID

---

### Step 5: Test & Go Live! (5 menit)

1. **Activate Workflow:**
   - Toggle switch → ON

2. **Test:**
   - Kirim WhatsApp: "Halo"
   - Cek dapat auto-reply?
   - Cek Telegram dapat notif?
   - Cek Google Sheets ada data?

3. **Customize:**
   - Edit message sesuai brand Anda
   - Ubah jam operasional
   - Tambah info kontak

4. **Go Live!** 🎉

---

## 🎯 Next Steps

### Untuk Client:

1. **Customize Messages**
   - Sesuaikan dengan brand voice
   - Tambah info promo
   - Update jam operasional

2. **Setup Inventory** (jika pakai Growth/Pro)
   - Isi data produk di Google Sheets
   - Set minimum stock
   - Test alert

3. **Train Team**
   - Ajari cara cek dashboard
   - Cara handle notifikasi
   - Cara update data

4. **Monitor & Optimize**
   - Cek daily execution
   - Review customer feedback
   - Optimize message templates

### Untuk Anda (Service Provider):

1. **Portfolio Building**
   - Screenshot workflows
   - Record demo video
   - Collect testimonials

2. **Marketing**
   - Post di social media
   - Share case study
   - Reach out to leads

3. **Scale**
   - Automate onboarding
   - Create templates
   - Build team

---

## 💡 Tips Sukses

### Untuk Client:

✅ **DO:**
- Test workflow sebelum go-live
- Backup data regularly
- Monitor execution log
- Update message templates berkala
- Respond to customer yang butuh human touch

❌ **DON'T:**
- Jangan ubah workflow tanpa backup
- Jangan share credential
- Jangan ignore error notifications
- Jangan 100% rely on automation (tetap monitor)

### Untuk Service Provider:

✅ **DO:**
- Under-promise, over-deliver
- Document everything
- Provide excellent support
- Ask for testimonials
- Keep learning & improving

❌ **DON'T:**
- Jangan ambil client lebih dari kapasitas
- Jangan skip testing
- Jangan ignore client messages
- Jangan stop marketing
- Jangan takut charge premium

---

## 📊 Success Metrics

### Week 1:
- [ ] Workflow running smoothly
- [ ] No critical errors
- [ ] Client comfortable using system

### Month 1:
- [ ] Client hemat min 20 jam
- [ ] Response time improve 50%+
- [ ] Client satisfied (testimonial!)

### Month 3:
- [ ] Client revenue increase
- [ ] Workflow optimized
- [ ] Upsell opportunity (maintenance/add-ons)

---

## 🎁 Bonus Resources

### Templates:
- ✅ Message templates (10+ variations)
- ✅ Invoice template (customizable)
- ✅ Google Sheets template
- ✅ Proposal template
- ✅ Contract template

### Guides:
- ✅ Setup guide (detailed)
- ✅ Troubleshooting guide
- ✅ Marketing strategy
- ✅ Sales script
- ✅ Pricing structure

### Tools:
- ✅ ROI calculator
- ✅ Pricing calculator
- ✅ Project timeline template

---

## 🆘 Need Help?

### Self-Service:
1. Check `docs/setup-guide.md`
2. Check `workflows/README.md`
3. Check n8n docs: https://docs.n8n.io
4. Check n8n community: https://community.n8n.io

### Contact Support:
- **WhatsApp:** +62 812-3456-7890
- **Email:** hello@autotoko.id
- **Telegram:** @autotoko

**Response Time:**
- Starter: 24 jam
- Growth: 12 jam
- Pro: 6 jam

---

## 🚀 Ready to Launch?

### Pre-Launch Checklist:

**Technical:**
- [ ] n8n installed & running
- [ ] All credentials configured
- [ ] Workflows imported & tested
- [ ] Google Sheets setup
- [ ] Messages customized

**Business:**
- [ ] Landing page live
- [ ] Social media ready
- [ ] Pricing finalized
- [ ] Proposal template ready
- [ ] Contract template ready

**Marketing:**
- [ ] Content calendar created
- [ ] First 10 posts ready
- [ ] Target audience identified
- [ ] Outreach list prepared
- [ ] Launch promo planned

### Launch Day:

1. **Announce:**
   - Post di semua social media
   - WhatsApp broadcast
   - Email blast (if any)

2. **Engage:**
   - Reply semua comments
   - Answer questions
   - Share behind the scenes

3. **Follow Up:**
   - Reach out to warm leads
   - Offer free consultation
   - Send proposals

4. **Celebrate!** 🎉

---

## 💪 You Got This!

Ingat:
- Start small, iterate fast
- Focus on value, not features
- Listen to customers
- Keep improving
- Don't give up!

**"The best time to start was yesterday. The second best time is now."**

---

## 📞 Let's Connect!

Punya pertanyaan? Success story? Feedback?

Share dengan kami:
- Instagram: @autotoko
- Email: hello@autotoko.id
- WhatsApp: +62 812-3456-7890

Kami excited untuk lihat kesuksesan Anda! 🚀

---

**Last Updated:** 2024
**Version:** 1.0

**Happy Automating! 🎉**
