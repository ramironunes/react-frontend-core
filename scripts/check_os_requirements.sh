#!/bin/bash
# @Author: Ramiro Luiz Nunes
# @Date:   2024-05-30 22:22:00
# @Last Modified by:   Ramiro Luiz Nunes
# @Last Modified time: 2024-05-30 22:43:21

# Define some ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Check if Node.js is installed
if ! command -v node &> /dev/null
then
    echo -e "${RED}Node.js is not installed. Installing Node.js...${NC}"
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo -e "${CYAN}Installing Node.js...${NC}"
        sudo apt update
        sudo apt install -y nodejs npm
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        if ! command -v brew &> /dev/null; then
            echo -e "${CYAN}Homebrew is not installed. Installing Homebrew...${NC}"
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        echo -e "${CYAN}Installing Node.js via Homebrew...${NC}"
        brew install node
    else
        echo -e "${RED}Unsupported OS. Please install Node.js manually.${NC}"
        exit 1
    fi
fi

# Check if npm is installed
if ! command -v npm &> /dev/null
then
    echo -e "${RED}npm is not installed. Installing npm...${NC}"
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo -e "${CYAN}Installing npm...${NC}"
        sudo apt update
        sudo apt install -y npm
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo -e "${CYAN}Installing npm via Homebrew...${NC}"
        brew install npm
    else
        echo -e "${RED}Unsupported OS. Please install npm manually.${NC}"
        exit 1
    fi
fi

# Check if npx is available
if ! command -v npx &> /dev/null
then
    echo -e "${RED}npx is not available. Updating npm to get npx...${NC}"
    echo -e "${CYAN}Updating npm...${NC}"
    npm install -g npm
fi

echo -e "${GREEN}All OS requirements are met.${NC}"
