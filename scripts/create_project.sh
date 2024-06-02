#!/bin/bash
# @Author: Ramiro Luiz Nunes
# @Date:   2024-05-30 22:22:16
# @Last Modified by:   Ramiro Luiz Nunes
# @Last Modified time: 2024-06-02 20:06:56

# Import the functions from utils.sh
source scripts/utils.sh

# Project name
PROJECT_NAME="react-frontend-core"
TEMP_DIR="temp-react-setup"

# Create React project in a temporary directory
echo -e "${BLUE}Creating React project in a temporary directory...${NC}"
npx create-react-app $TEMP_DIR --template typescript

# Verify if the project directory was created successfully
if [ ! -f "$TEMP_DIR/package.json" ]; then
  echo -e "${RED}Error: Failed to create the React project. Please check the npx command.${NC}"
  exit 1
fi

# Move files to the current directory
echo -e "${BLUE}Moving project files to the current directory...${NC}"
mv $TEMP_DIR/* $TEMP_DIR/.[!.]* .

# Remove temporary directory
rm -rf $TEMP_DIR

# Verify the creation of index.html
if [ ! -f "public/index.html" ]; then
  echo -e "${RED}Error: index.html not found in public directory. Something went wrong with create-react-app.${NC}"
  exit 1
fi

echo -e "${GREEN}React project created successfully.${NC}"

# Install additional libraries
echo -e "${BLUE}Installing additional libraries (axios, react-router-dom)...${NC}"
npm install axios react-router-dom --legacy-peer-deps

# Install React Admin and Material-UI
echo -e "${BLUE}Installing React Admin and Material-UI...${NC}"
npm install ra-core ra-ui-materialui @mui/material @mui/icons-material --legacy-peer-deps

# Install peer dependencies
echo -e "${BLUE}Installing peer dependencies...${NC}"
npm install react@^18.0.0 react-dom@^18.0.0 react-hook-form@^7.43.9 history@^5.1.0

# Create logs directory
mkdir -p logs

# Update package.json to include log redirection and new scripts
echo -e "${BLUE}Configuring npm scripts to redirect logs...${NC}"
jq '.scripts.start = "react-scripts start 2>&1 | tee logs/start.log" |
    .scripts.build = "react-scripts build 2>&1 | tee logs/build.log" |
    .scripts.test = "react-scripts test 2>&1 | tee logs/test.log" |
    .scripts.eject = "react-scripts eject 2>&1 | tee logs/eject.log"' package.json > package.json.tmp && mv package.json.tmp package.json

# Ensure all dependencies are installed
echo -e "${BLUE}Ensuring all dependencies are installed...${NC}"
npm install --legacy-peer-deps

# Fix vulnerabilities (non-breaking changes)
echo -e "${BLUE}Fixing vulnerabilities (non-breaking changes)...${NC}"
npm audit fix

# Fix vulnerabilities (including breaking changes)
echo -e "${BLUE}Fixing vulnerabilities (including breaking changes)...${NC}"
npm audit fix --force

# Completion message
echo -e "${GREEN}Project setup is complete.${NC}"
