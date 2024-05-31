#!/bin/bash
# @Author: Ramiro Luiz Nunes
# @Date:   2024-05-30 22:22:16
# @Last Modified by:   Ramiro Luiz Nunes
# @Last Modified time: 2024-05-30 23:06:23

# Project name
PROJECT_NAME="react-frontend-core"

# Create React project
echo -e "${BLUE}Creating React project ${PROJECT_NAME}...${NC}"
npx create-react-app $PROJECT_NAME
cd $PROJECT_NAME

# Install additional libraries
echo -e "${BLUE}Installing additional libraries (axios, react-router-dom)...${NC}"
npm install axios react-router-dom --legacy-peer-deps

# Install React Admin and Material-UI
echo -e "${BLUE}Installing React Admin and Material-UI...${NC}"
npm install ra-core ra-ui-materialui @material-ui/core @material-ui/icons --legacy-peer-deps

# Create logs directory
mkdir -p logs

# Update package.json to include log redirection
echo -e "${BLUE}Configuring npm scripts to redirect logs...${NC}"
jq '.scripts.start = "react-scripts start 2>&1 | tee logs/start.log" |
    .scripts.build = "react-scripts build 2>&1 | tee logs/build.log" |
    .scripts.test = "react-scripts test 2>&1 | tee logs/test.log" |
    .scripts.eject = "react-scripts eject 2>&1 | tee logs/eject.log"' package.json > package.json.tmp && mv package.json.tmp package.json

# Ensure all dependencies are installed
echo -e "${BLUE}Ensuring all dependencies are installed...${NC}"
npm install --legacy-peer-deps
