#!/bin/bash
# @Author: Ramiro Luiz Nunes
# @Date:   2024-05-30 23:35:58
# @Last Modified by:   Ramiro Luiz Nunes
# @Last Modified time: 2024-06-02 20:10:24

# Import the functions from utils.sh
source scripts/utils.sh

# Project name
PROJECT_NAME="react-frontend-core"

# Confirm the uninstallation
echo -e "${RED}Are you sure you want to uninstall the project ${PROJECT_NAME}? This action cannot be undone. (y/n)${NC}"
read -r confirmation

if [ "$confirmation" != "y" ]; then
  echo -e "${BLUE}Uninstallation cancelled.${NC}"
  exit 0
fi

print_separator

# Redirect output to a log file
LOG_FILE="logs/uninstall_project.log"
mkdir -p logs
exec > >(tee -i ${LOG_FILE})
exec 2>&1

# Remove the project files
echo -e "${BLUE}Removing the project files...${NC}"
rm -rf node_modules package-lock.json package.json src public tsconfig.json

print_separator

# Optional: Uninstall Node.js and npm if they were installed specifically for this project
echo -e "${RED}Do you also want to uninstall Node.js and npm? (y/n)${NC}"
read -r uninstall_node

if [ "$uninstall_node" = "y" ]; then
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo -e "${CYAN}Uninstalling Node.js and npm...${NC}"
    sudo apt-get remove -y nodejs npm
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "${CYAN}Uninstalling Node.js and npm via Homebrew...${NC}"
    brew uninstall node
  else
    echo -e "${RED}Unsupported OS. Please uninstall Node.js manually.${NC}"
  fi
fi

print_separator

# Completion message
echo -e "${GREEN}Project ${PROJECT_NAME} and its dependencies have been uninstalled.${NC}"
print_separator

# Remove the log file if the uninstallation was successful
rm -f ${LOG_FILE}

# Return to the main menu
source manage_project.sh
main_menu
