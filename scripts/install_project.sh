#!/bin/bash
# @Author: Ramiro Luiz Nunes
# @Date:   2024-05-30 22:02:41
# @Last Modified by:   Ramiro Luiz Nunes
# @Last Modified time: 2024-06-06 10:47:28

# Import the functions from utils.sh
source scripts/utils.sh

# Check if the project is already installed
if [ -d "node_modules" ] || [ -f "package.json" ]; then
    echo -e "${RED}Project is already installed. To reinstall, please run uninstall_project.sh first.${NC}"
    exit 1
fi

# Print a colorful header
echo -e "${GREEN}================================================================================${NC}"
echo -e "${CYAN}                         Installing React Frontend Core                         ${NC}"
echo -e "${GREEN}================================================================================${NC}"

# Redirect output to a log file
LOG_FILE="logs/install_project.log"
mkdir -p logs
exec > >(tee -i ${LOG_FILE})
exec 2>&1

# Check OS requirements
echo -e "${YELLOW}Checking OS requirements...${NC}"
if ! source scripts/check_os_requirements.sh; then
    echo -e "${RED}OS requirements check failed. See ${LOG_FILE} for details.${NC}"
    exit 1
fi
print_separator

# Create a temporary directory for the React project
TEMP_DIR="temp-react-setup"
mkdir -p ${TEMP_DIR}

# Navigate to the temporary directory
cd ${TEMP_DIR}

# Prompt for project template
echo -e "${YELLOW}Choose a project template:${NC}"
echo "1. JavaScript"
echo "2. TypeScript"
read -p "Enter your choice (1 or 2): " template_choice

if [ "$template_choice" == "1" ]; then
    npx create-react-app . --template cra-template
elif [ "$template_choice" == "2" ]; then
    npx create-react-app . --template cra-template-typescript
else
    echo -e "${RED}Invalid choice. Exiting...${NC}"
    exit 1
fi

# Copy the created React project to the target directory
cd ..
cp -r ${TEMP_DIR}/* .
rm -rf ${TEMP_DIR}

# Apply the OpenSSL legacy provider fix
sed -i 's/"start": "react-scripts start"/"start": "NODE_OPTIONS=--openssl-legacy-provider react-scripts start"/' package.json
sed -i 's/"build": "react-scripts build"/"build": "NODE_OPTIONS=--openssl-legacy-provider react-scripts build"/' package.json
sed -i 's/"test": "react-scripts test"/"test": "NODE_OPTIONS=--openssl-legacy-provider react-scripts test"/' package.json

print_separator

# Completion message
echo -e "${GREEN}Project setup is complete.${NC}"
print_separator

# Remove the log file if the installation was successful
rm -f ${LOG_FILE}
