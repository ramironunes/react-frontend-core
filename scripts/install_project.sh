#!/bin/bash
# @Author: Ramiro Luiz Nunes
# @Date:   2024-05-30 22:02:41
# @Last Modified by:   Ramiro Luiz Nunes
# @Last Modified time: 2024-05-30 22:35:44

# Define some ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

# Print a colorful header
echo -e "${GREEN}========================================================${NC}"
echo -e "${CYAN}          Installing React Frontend Core               ${NC}"
echo -e "${GREEN}========================================================${NC}"

# Include utility functions
source scripts/utils.sh

# Check OS requirements
echo -e "${YELLOW}Checking OS requirements...${NC}"
source scripts/check_os_requirements.sh

# Create project and install libraries
echo -e "${YELLOW}Creating project and installing libraries...${NC}"
source scripts/create_project.sh

# Setup configuration files
echo -e "${YELLOW}Setting up configuration files...${NC}"
source scripts/setup_utils.sh

# Completion message
echo -e "${GREEN}Project setup is complete.${NC}"
