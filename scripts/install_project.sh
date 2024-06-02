#!/bin/bash
# @Author: Ramiro Luiz Nunes
# @Date:   2024-05-30 22:02:41
# @Last Modified by:   Ramiro Luiz Nunes
# @Last Modified time: 2024-06-02 20:24:32

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

# Create project and install libraries
echo -e "${YELLOW}Creating project and installing libraries...${NC}"
if ! source scripts/create_project.sh; then
    echo -e "${RED}Project creation failed. See ${LOG_FILE} for details.${NC}"
    exit 1
fi
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
