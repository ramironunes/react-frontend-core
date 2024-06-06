#!/bin/bash
# @Author: Ramiro Luiz Nunes
# @Date:   2024-05-30 22:58:44
# @Last Modified by:   Ramiro Luiz Nunes
# @Last Modified time: 2024-06-06 10:47:56

# Import the functions from utils.sh
source scripts/utils.sh

# Check if Node.js is installed
if ! command_exists node; then
    echo -e "${RED}Node.js is not installed. Installing Node.js...${NC}"
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt-get remove -y nodejs libnode-dev
        sudo apt-get autoremove -y
        curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
        sudo apt-get install -y nodejs
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install node@20
        brew link --overwrite node@20
    else
        echo -e "${RED}Unsupported OS. Please install Node.js manually.${NC}"
        exit 1
    fi
fi

# Check if npm is installed
if ! command_exists npm; then
    echo -e "${RED}npm is not installed. Please install npm.${NC}"
    exit 1
fi

# Check if npx is available
if ! command_exists npx; then
    echo -e "${RED}npx is not available. Updating npm to get npx...${NC}"
    npm install -g npm
fi

# Ensure correct Node.js version
REQUIRED_NODE_VERSION="20.0.0"
CURRENT_NODE_VERSION=$(node -v | cut -d'v' -f2)

if [[ "$(printf '%s\n' "$REQUIRED_NODE_VERSION" "$CURRENT_NODE_VERSION" | sort -V | head -n1)" != "$REQUIRED_NODE_VERSION" ]]; then 
    echo -e "${RED}Node.js version is less than ${REQUIRED_NODE_VERSION}.${NC}"
    echo -e "${RED}Do you want to uninstall the current version and install Node.js 20? (y/n)${NC}"
    read -r confirmation
    if [ "$confirmation" != "y" ]; then
        echo -e "${RED}Please update Node.js to version 20 or higher to proceed.${NC}"
        exit 1
    fi

    # Uninstall current Node.js
    echo -e "${CYAN}Uninstalling current Node.js...${NC}"
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt-get remove -y nodejs libnode-dev
        sudo apt-get autoremove -y
        curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
        sudo apt-get install -y nodejs
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew uninstall node
        brew install node@20
        brew link --overwrite node@20
    else
        echo -e "${RED}Unsupported OS. Please install Node.js manually.${NC}"
        exit 1
    fi

    # Verify the new installation
    if ! command_exists node; then
        echo -e "${RED}Failed to install Node.js 20 or higher. Please install it manually.${NC}"
        exit 1
    fi

    CURRENT_NODE_VERSION=$(node -v | cut -d'v' -f2)
    if [[ "$(printf '%s\n' "$REQUIRED_NODE_VERSION" "$CURRENT_NODE_VERSION" | sort -V | head -n1)" != "$REQUIRED_NODE_VERSION" ]]; then 
        echo -e "${RED}Failed to install Node.js 20 or higher. Please install it manually.${NC}"
        exit 1
    fi
fi

echo -e "${GREEN}All OS requirements are met.${NC}"
