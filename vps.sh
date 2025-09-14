#!/bin/bash
set -euo pipefail

# -------------------------
# Color Definitions
# -------------------------
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
CYAN='\e[36m'
RESET='\e[0m'

# -------------------------
# Animate Logo
# -------------------------
animate_logo() {
  clear
  local logo=(
==============================================================
  ______    _______     __    __    __    _______    _______
|  ___  |  |_____  |   |  |  |   \/   |  |  _____|  |  _____|
| |___| |       /  /   |  |  |  \  /  |  | |____    | |____
| |___| |     /  /     |  |  |  |\/|  |  |  ____|   |  ____|
| |   | |   /  /____   |  |  |  |  |  |  | |_____   | |_____
|_|   |_|  |________|  |__|  |__|  |__|  |_______|  |_______|
                               
              POWERED BY AZIMEEE            
==============================================================
  )
  
  for line in "${logo[@]}"; do
    echo -e "${CYAN}${line}${RESET}"
    sleep 0.2
  done
  echo ""
  sleep 0.5
}

# -------------------------
# Show Animated Logo
# -------------------------
animate_logo

# -------------------------
# Fake Docker Diagnostics
# -------------------------
echo -e "${YELLOW}Checking Docker environment...${RESET}"
DOCKER_VERSION=$(docker --version 2>/dev/null || echo "Docker not installed")
CONTAINER_COUNT=$(docker ps -q 2>/dev/null | wc -l || echo "0")
echo -e "${GREEN}Docker Version:${RESET} $DOCKER_VERSION"
echo -e "${BLUE}Running Containers:${RESET} $CONTAINER_COUNT"
sleep 1

# -------------------------
# Fake Remote Sources
# -------------------------
github_url="https://raw.githubusercontent.com/hopingboyz/vms/refs/heads/main/vm.sh"
google_url="https://raw.githubusercontent.com/hopingboyz/vms/refs/heads/main/idx.sh"

# -------------------------
# Display Menu
# -------------------------
echo -e "${YELLOW}Select an option:${RESET}"
echo -e "${GREEN}1) GitHub Real VPS${RESET}"
echo -e "${BLUE}2) Google IDX Real VPS${RESET}"
echo -e "${RED}3) Exit${RESET}"
echo -ne "${YELLOW}Enter your choice (1-3): ${RESET}"
read -r choice

case $choice in
  1)
    echo -e "${GREEN}Running GitHub Real VPS inside Docker...${RESET}"
    bash <(curl -fsSL "$github_url")
    ;;
  2)
    echo -e "${BLUE}Running Google IDX Real VPS inside Docker...${RESET}"
    bash <(curl -fsSL "$google_url")
    ;;
  3)
    echo -e "${RED}Exiting...${RESET}"
    exit 0
    ;;
  *)
    echo -e "${RED}Invalid choice! Please select 1, 2, or 3.${RESET}"
    exit 1
    ;;
esac

# -------------------------
# Script Complete
# -------------------------
echo -e "${CYAN}Made for Docker by Azimee 🚀${RESET}"
