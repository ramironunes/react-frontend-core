#!/bin/bash
# @Author: Ramiro Luiz Nunes
# @Date:   2024-05-30 22:02:41
# @Last Modified by:   Ramiro Luiz Nunes
# @Last Modified time: 2024-06-06 22:47:51

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

# Prompt user to select the template type
echo "Select the project template type:"
echo "1. TypeScript"
echo "2. JavaScript"
read -p "Enter your choice (1 or 2): " template_choice

case $template_choice in
    1)
        template="--template typescript"
        ;;
    2)
        template=""
        ;;
    *)
        echo -e "${RED}Invalid choice. Exiting...${NC}"
        exit 1
        ;;
esac

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

# Create the React project with the selected template
echo -e "${YELLOW}Creating project and installing libraries...${NC}"
if ! npx create-react-app . $template; then
    echo -e "${RED}Project creation failed. See ${LOG_FILE} for details.${NC}"
    exit 1
fi

# Copy the created React project to the target directory
cd ..
cp -r ${TEMP_DIR}/* .
rm -rf ${TEMP_DIR}

# Update package.json with the correct project name
sed -i 's/"name": "temp-react-setup"/"name": "react-frontend-core"/' package.json

# Apply the OpenSSL legacy provider fix with logging
sed -i 's|"start": "react-scripts start"|"start": "NODE_OPTIONS=--openssl-legacy-provider react-scripts start 2>&1 | tee logs/start.log"|' package.json
sed -i 's|"build": "react-scripts build"|"build": "NODE_OPTIONS=--openssl-legacy-provider react-scripts build 2>&1 | tee logs/build.log"|' package.json
sed -i 's|"test": "react-scripts test"|"test": "NODE_OPTIONS=--openssl-legacy-provider react-scripts test 2>&1 | tee logs/test.log"|' package.json
sed -i 's|"eject": "react-scripts eject"|"eject": "react-scripts eject 2>&1 | tee logs/eject.log"|' package.json

print_separator

# Setup configuration files
echo -e "${YELLOW}Setting up configuration files...${NC}"
if ! source scripts/setup_utils.sh; then
    echo -e "${RED}Setup configuration failed. See ${LOG_FILE} for details.${NC}"
    exit 1
fi
print_separator

# Completion message
echo -e "${GREEN}Project setup is complete.${NC}"
print_separator

# Remove the log file if the installation was successful
rm -f ${LOG_FILE}
