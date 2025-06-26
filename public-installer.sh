#!/bin/bash

# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                         🔥 S2CODE PROXY INSTALLER 🔥                        ║
# ║                           SIMPLE WORKING VERSION                            ║
# ║──────────────────────────────────────────────────────────────────────────────║
# ║  👨‍💻 Developer: TẠ NGỌC LONG                                                  ║
# ║  📞 Contact: 08.77.79.71.75                                                 ║
# ║  💬 Telegram: @S2codetaem48                                                 ║
# ║  🌐 Facebook: https://www.facebook.com/s2code08122000/                      ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

echo -e "${CYAN}╔══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${RED}                        🔥 TẠO PROXY S2CODE AUTO 🔥                          ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}                           by TẠ NGỌC LONG - S2CODE                          ${CYAN}║${NC}"
echo -e "${CYAN}║${GREEN}                              ✅ WORKING VERSION ✅                          ${CYAN}║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${WHITE}🚀 Chào mừng đến với S2CODE Proxy Auto Installer!${NC}"
echo -e "${WHITE}👨‍💻 Developer: TẠ NGỌC LONG${NC}"
echo -e "${WHITE}📞 Hotline: 08.77.79.71.75${NC}"
echo -e "${WHITE}💬 Telegram: @S2codetaem48${NC}"
echo ""

# Kiểm tra system requirements
echo -e "${BLUE}[1/3]${NC} ${YELLOW}➤${NC} ${WHITE}Kiểm tra system requirements...${NC}"

# Check curl
if ! command -v curl &> /dev/null; then
    echo -e "${YELLOW}⚠️  curl chưa cài đặt. Đang cài đặt...${NC}"
    sudo apt update && sudo apt install -y curl
fi

# Check if running as root or with sudo
if [ "$EUID" -eq 0 ]; then
    echo -e "${GREEN}✅ Running with root privileges${NC}"
elif sudo -n true 2>/dev/null; then
    echo -e "${GREEN}✅ Sudo access available${NC}"
else
    echo -e "${RED}❌ Cần quyền sudo để cài đặt. Vui lòng chạy với sudo!${NC}"
    exit 1
fi

echo -e "${BLUE}[2/3]${NC} ${YELLOW}➤${NC} ${WHITE}Đang tải script chính...${NC}"

# Simple direct download - multiple fallback URLs
echo -e "${YELLOW}🔍 Trying to download script...${NC}"

# List of possible URLs (add your own URLs here)
SCRIPT_URLS=(
    "https://raw.githubusercontent.com/s2codetaem/s2code-installer/main/admin.sh"
    "https://raw.githubusercontent.com/s2codetaem/admin.sh/main/admin.sh"
    "https://cdn.jsdelivr.net/gh/s2codetaem/s2code-installer@main/admin.sh"
)

main_script=""
for url in "${SCRIPT_URLS[@]}"; do
    echo -e "${YELLOW}📥 Trying: $url${NC}"
    main_script=$(curl -s --max-time 30 "$url" 2>/dev/null)
    
    if [ -n "$main_script" ] && [ ${#main_script} -gt 100 ]; then
        echo -e "${GREEN}✅ Download successful from: $url${NC}"
        break
    else
        echo -e "${RED}❌ Failed from: $url${NC}"
        main_script=""
    fi
done

# If all URLs failed, show manual download instruction
if [ -z "$main_script" ] || [ ${#main_script} -lt 100 ]; then
    echo -e "${RED}❌ Không thể tải script tự động!${NC}"
    echo ""
    echo -e "${YELLOW}🔧 HƯỚNG DẪN TẢI THỦ CÔNG:${NC}"
    echo ""
    echo -e "${WHITE}Chạy các lệnh sau:${NC}"
    echo -e "${GREEN}wget https://raw.githubusercontent.com/s2codetaem/admin.sh/main/admin.sh${NC}"
    echo -e "${GREEN}chmod +x admin.sh${NC}"
    echo -e "${GREEN}sudo ./admin.sh${NC}"
    echo ""
    echo -e "${WHITE}Hoặc từ GitHub:${NC}"
    echo -e "${GREEN}git clone https://github.com/s2codetaem/admin.sh.git${NC}"
    echo -e "${GREEN}cd admin.sh${NC}"
    echo -e "${GREEN}sudo bash admin.sh${NC}"
    echo ""
    echo -e "${CYAN}📞 Cần hỗ trợ liên hệ:${NC}"
    echo -e "${WHITE}• SĐT/Zalo: 08.77.79.71.75${NC}"
    echo -e "${WHITE}• Telegram: @S2codetaem48${NC}"
    echo -e "${WHITE}• Facebook: https://www.facebook.com/s2code08122000/${NC}"
    exit 1
fi

echo -e "${BLUE}[3/3]${NC} ${YELLOW}➤${NC} ${WHITE}Khởi chạy S2CODE Proxy Installer...${NC}"
echo ""

# Simple validation
if echo "$main_script" | grep -q "S2CODE" && echo "$main_script" | grep -q "SQUID PROXY"; then
    echo -e "${GREEN}✅ Script validation passed${NC}"
    echo ""
    
    # Execute the main script
    echo "$main_script" | bash
else
    echo -e "${RED}❌ Script validation failed!${NC}"
    echo ""
    echo -e "${YELLOW}🔧 Chạy script trực tiếp:${NC}"
    echo -e "${GREEN}curl -sL https://raw.githubusercontent.com/s2codetaem/admin.sh/main/admin.sh | bash${NC}"
    echo ""
    echo -e "${CYAN}📞 Liên hệ hỗ trợ:${NC}"
    echo -e "${WHITE}• SĐT: 08.77.79.71.75${NC}"
    echo -e "${WHITE}• Telegram: @S2codetaem48${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}🎉 Cảm ơn bạn đã sử dụng S2CODE Proxy Installer!${NC}"
echo -e "${CYAN}📞 Support 24/7: 08.77.79.71.75${NC}" 
