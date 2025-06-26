# 🤖 S2CODE PROXY MANAGEMENT SYSTEM

**Hệ thống quản lý proxy tự động với Telegram Bot**

👨‍💻 **Developer:** TẠ NGỌC LONG  
📞 **Contact:** 08.77.79.71.75  
📱 **Telegram:** https://t.me/S2codetaem48  
💬 **Facebook:** https://www.facebook.com/s2code08122000/

---

## 🚀 TÍNH NĂNG

### ✨ **Telegram Bot Admin Panel:**
- 📝 Tạo/xóa/sửa khách hàng
- ⏰ Gia hạn license real-time
- 🔍 Tìm kiếm thông tin khách hàng
- 📊 Thống kê sử dụng chi tiết
- 🔄 Theo dõi usage logs
- 🤖 Auto notification khi tạo proxy

### 💻 **Script Features:**
- 🔐 Xác thực qua Telegram Bot
- 📱 Fallback to file-based storage
- 🌐 Auto proxy testing
- 📋 Detailed proxy information
- 🎨 Colorful UI với progress bars
- ⚡ Real-time status updates

---

## 📋 HƯỚNG DẪN CÀI ĐẶT

### **BƯỚC 1: Tạo Telegram Bot**

1. Nhắn **@BotFather** trên Telegram
2. Gửi `/newbot`
3. Đặt tên và username cho bot
4. **Lưu TOKEN** nhận được
5. Nhắn **@userinfobot** để lấy **Chat ID**

### **BƯỚC 2: Cài đặt Bot Server**

```bash
# Cập nhật hệ thống
sudo apt update && sudo apt upgrade -y

# Cài đặt Python và dependencies
sudo apt install -y python3 python3-pip python3-venv curl git

# Tạo thư mục bot
sudo mkdir -p /opt/s2code-bot
cd /opt/s2code-bot

# Tạo virtual environment
sudo python3 -m venv venv
sudo /opt/s2code-bot/venv/bin/pip install pyTelegramBotAPI==4.14.0
```

### **BƯỚC 3: Tạo Bot Code**

```bash
sudo nano /opt/s2code-bot/s2code_bot.py
```

**Paste code bot Python hoàn chỉnh** (xem file `s2code_bot.py`)

### **BƯỚC 4: Cấu hình Bot**

Sửa trong file `s2code_bot.py`:
```python
BOT_TOKEN = "YOUR_BOT_TOKEN_HERE"        # Thay bằng token thật
ADMIN_CHAT_ID = "YOUR_ADMIN_CHAT_ID"     # Thay bằng chat ID thật
```

### **BƯỚC 5: Tạo Service**

```bash
sudo nano /etc/systemd/system/s2code-bot.service
```

```ini
[Unit]
Description=S2CODE Telegram Bot
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/opt/s2code-bot
Environment=PATH=/opt/s2code-bot/venv/bin
ExecStart=/opt/s2code-bot/venv/bin/python s2code_bot.py
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

### **BƯỚC 6: Khởi động Bot**

```bash
sudo chmod +x /opt/s2code-bot/s2code_bot.py
sudo systemctl daemon-reload
sudo systemctl enable s2code-bot
sudo systemctl start s2code-bot

# Kiểm tra status
sudo systemctl status s2code-bot
```

### **BƯỚC 7: Cấu hình Script**

Trong file `admin.sh`, cập nhật:
```bash
BOT_TOKEN="YOUR_BOT_TOKEN_HERE"     # Thay bằng token thật
BOT_CHAT_ID="YOUR_ADMIN_CHAT_ID"    # Thay bằng chat ID thật
```

### **BƯỚC 8: Upload lên GitHub**

```bash
git init
git add admin.sh
git commit -m "S2CODE Proxy Script"
git branch -M main
git remote add origin https://github.com/yourusername/s2code-proxy.git
git push -u origin main
```

---

## 🎯 CÁCH SỬ DỤNG

### **📱 Telegram Bot Commands:**

```
/start                                          - Khởi động bot
/add_user <name> <username> <password> <key> <days> <uses>  - Tạo user mới
/list_users                                     - Danh sách users
/find_user <username>                           - Tìm thông tin user
/extend_time <username> <days>                  - Gia hạn thời gian
/add_uses <username> <number>                   - Thêm lượt sử dụng
/delete_user <username>                         - Xóa user
/stats                                          - Thống kê tổng quan
/logs                                           - Xem lịch sử
/help                                           - Hướng dẫn
```

### **💻 Script Usage:**

**Khách hàng chạy:**
```bash
curl -sL https://raw.githubusercontent.com/yourusername/s2code-proxy/main/admin.sh | bash
```

**Hoặc:**
```bash
wget -qO- https://raw.githubusercontent.com/yourusername/s2code-proxy/main/admin.sh | bash
```

---

## 📊 DATABASE SCHEMA

```sql
-- Bảng customers
CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_key TEXT UNIQUE NOT NULL,
    created_at TEXT NOT NULL,
    expires_at TEXT NOT NULL,
    total_uses INTEGER DEFAULT 0,
    used_count INTEGER DEFAULT 0,
    status TEXT DEFAULT 'active'
);

-- Bảng usage_logs
CREATE TABLE usage_logs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    license_key TEXT NOT NULL,
    action TEXT NOT NULL,
    ip_address TEXT,
    timestamp TEXT NOT NULL,
    details TEXT
);
```

---

## 🔧 TROUBLESHOOTING

### **Bot không hoạt động:**
```bash
# Kiểm tra logs
sudo journalctl -u s2code-bot -f

# Restart bot
sudo systemctl restart s2code-bot

# Kiểm tra database
cd /opt/s2code-bot
sqlite3 s2code_data.db ".tables"
```

### **Script không kết nối Bot:**
- Kiểm tra BOT_TOKEN và BOT_CHAT_ID
- Đảm bảo bot đã được start (`/start`)
- Kiểm tra internet connection

### **Proxy không hoạt động:**
- Kiểm tra firewall: `sudo ufw allow 6969`
- Kiểm tra Squid: `sudo systemctl status squid`
- Test port: `nc -z localhost 6969`

---

## 📈 MONITORING

### **Real-time Bot Status:**
```bash
# Monitor bot logs
sudo journalctl -u s2code-bot -f

# Check database
cd /opt/s2code-bot
sqlite3 s2code_data.db "SELECT COUNT(*) FROM customers;"
```

### **Script Analytics:**
Bot tự động gửi thông báo:
- 🔥 Khi có proxy được tạo
- ❌ Khi có lỗi xảy ra
- 📊 Thống kê định kỳ (6h/lần)

---

## 🌟 EXAMPLES

### **Tạo user mới:**
```
/add_user "Nguyen Van A" nguyenvana pass123 KEY-ABC-123 30 50
```

### **Gia hạn license:**
```
/extend_time nguyenvana 15
```

### **Share script với khách:**
```
Khách hàng chạy lệnh sau để tạo proxy:

curl -sL https://raw.githubusercontent.com/tngoclong/s2code-proxy/main/admin.sh | bash

Thông tin đăng nhập:
👤 Username: nguyenvana  
🔒 Password: pass123
🗝️ License: KEY-ABC-123
```

---

## 📞 SUPPORT

**🔥 Liên hệ hỗ trợ 24/7:**

- 👨‍💻 **Developer:** TẠ NGỌC LONG
- 📱 **SĐT/Zalo:** 08.77.79.71.75
- 💬 **Facebook:** https://www.facebook.com/s2code08122000/
- 📨 **Telegram:** https://t.me/S2codetaem48

**🎯 Services:**
- 🏢 Cung cấp tài khoản Google Cloud số lượng lớn
- 💼 Cung cấp nguồn ngang MMO
- 🌐 Nhận làm web thiết kế
- 📱 Tạo app iOS/Android & phần mềm PC

---

## 📄 LICENSE

```
MIT License - S2CODE Proxy Management System
Copyright (c) 2024 TẠ NGỌC LONG

Được phép sử dụng, sao chép, sửa đổi và phân phối.
Vui lòng giữ nguyên thông tin tác giả.
```

---

**🚀 READY TO USE! Hệ thống quản lý proxy chuyên nghiệp với Telegram Bot!** 