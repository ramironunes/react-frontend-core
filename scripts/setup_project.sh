#!/bin/bash
# @Author: Ramiro Luiz Nunes
# @Date:   2024-06-02 18:53:57
# @Last Modified by:   Ramiro Luiz Nunes
# @Last Modified time: 2024-06-02 20:24:18

# Import the functions from utils.sh
source scripts/utils.sh

# Print a colorful header
echo -e "${GREEN}================================================================================${NC}"
echo -e "${CYAN}                     Setting Up React Frontend Core Project                     ${NC}"
echo -e "${GREEN}================================================================================${NC}"

# Install project dependencies
echo -e "${YELLOW}Installing project dependencies...${NC}"
npm install --legacy-peer-deps

# Fix vulnerabilities (non-breaking changes)
echo -e "${BLUE}Fixing vulnerabilities (non-breaking changes)...${NC}"
npm audit fix

# Fix vulnerabilities (including breaking changes)
echo -e "${BLUE}Fixing vulnerabilities (including breaking changes)...${NC}"
npm audit fix --force

# Completion message
echo -e "${GREEN}Project setup is complete.${NC}"
print_separator

# Instructions to start the project
echo -e "${CYAN}To start the project, run: npm start${NC}"
