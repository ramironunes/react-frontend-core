#!/bin/bash
# @Author: Ramiro Luiz Nunes
# @Date:   2024-05-30 22:22:16
# @Last Modified by:   Ramiro Luiz Nunes
# @Last Modified time: 2024-05-30 22:36:25

# Project name
PROJECT_NAME="react-frontend-core"

# Create React project
echo -e "${BLUE}Creating React project ${PROJECT_NAME}...${NC}"
npx create-react-app $PROJECT_NAME
cd $PROJECT_NAME

# Install additional libraries
echo -e "${BLUE}Installing additional libraries (axios, react-router-dom)...${NC}"
npm install axios react-router-dom

# Install React Admin and Material-UI
echo -e "${BLUE}Installing React Admin and Material-UI...${NC}"
npm install ra-core ra-ui-materialui @material-ui/core @material-ui/icons
