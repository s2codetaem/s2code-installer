#!/bin/bash

# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                         🔥 S2CODE PROXY INSTALLER 🔥                        ║
# ║                              PUBLIC VERSION                                  ║
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
echo -e "${CYAN}║${GREEN}                              🔒 SECURE VERSION 🔒                           ${CYAN}║${NC}"
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

echo -e "${BLUE}[2/3]${NC} ${YELLOW}➤${NC} ${WHITE}Đang tải script chính từ server bảo mật...${NC}"

# Download the main script securely
# Note: Replace this URL with your private server or secure endpoint
SCRIPT_SERVER="https://secure.s2code.workers.dev"  # Example secure endpoint
MAIN_SCRIPT_URL="$SCRIPT_SERVER/proxy-installer"

# Try to download from secure server
main_script=$(curl -s --max-time 30 "$MAIN_SCRIPT_URL" 2>/dev/null)

if [ -z "$main_script" ] || [ ${#main_script} -lt 100 ]; then
    echo -e "${YELLOW}⚠️  Không thể kết nối server chính. Trying fallback...${NC}"
    
    # Fallback: Download from GitHub private repo using embedded token
    # Note: This token should have minimal permissions and be rotated regularly
    GITHUB_TOKEN="ghp_YOUR_PERSONAL_ACCESS_TOKEN_HERE"  # Replace with actual token
    PRIVATE_REPO_URL="https://raw.githubusercontent.com/YOUR_USERNAME/s2code-proxy-private/main/admin.sh"
    
    main_script=$(curl -s -H "Authorization: token $GITHUB_TOKEN" "$PRIVATE_REPO_URL" 2>/dev/null)
    
    if [ -z "$main_script" ] || [ ${#main_script} -lt 100 ]; then
        echo -e "${RED}❌ Không thể tải script từ server. Vui lòng liên hệ support!${NC}"
        echo ""
        echo -e "${CYAN}📞 Liên hệ hỗ trợ:${NC}"
        echo -e "${WHITE}• SĐT/Zalo: 08.77.79.71.75${NC}"
        echo -e "${WHITE}• Telegram: @S2codetaem48${NC}"
        echo -e "${WHITE}• Facebook: https://www.facebook.com/s2code08122000/${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}✅ Tải thành công từ fallback server${NC}"
else
    echo -e "${GREEN}✅ Tải thành công từ secure server${NC}"
fi

echo -e "${BLUE}[3/3]${NC} ${YELLOW}➤${NC} ${WHITE}Khởi chạy S2CODE Proxy Installer...${NC}"
echo ""

# Validate script content (basic security check)
if echo "$main_script" | grep -q "S2CODE" && echo "$main_script" | grep -q "SQUID PROXY"; then
    echo -e "${GREEN}✅ Script validation passed${NC}"
    echo ""
    
    # Execute the main script
    echo "$main_script" | bash
else
    echo -e "${RED}❌ Script validation failed! Possible security risk.${NC}"
    echo -e "${RED}🚨 Script content không hợp lệ. Vui lòng liên hệ support!${NC}"
    echo ""
    echo -e "${CYAN}📞 Liên hệ ngay:${NC}"
    echo -e "${WHITE}• SĐT: 08.77.79.71.75${NC}"
    echo -e "${WHITE}• Telegram: @S2codetaem48${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}🎉 Cảm ơn bạn đã sử dụng S2CODE Proxy Installer!${NC}"
echo -e "${CYAN}📞 Support 24/7: 08.77.79.71.75${NC}" 