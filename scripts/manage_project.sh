#!/bin/bash
# @Author: Ramiro Luiz Nunes
# @Date:   2024-06-02 17:59:43
# @Last Modified by:   Ramiro Luiz Nunes
# @Last Modified time: 2024-06-06 10:47:14

# Import the functions from utils.sh
source scripts/utils.sh

# Print a colorful header
echo -e "${GREEN}================================================================================${NC}"
echo -e "${CYAN}                           Manage React Frontend Core                           ${NC}"
echo -e "${GREEN}================================================================================${NC}"

main_menu() {
    echo "Choose an option:"
    echo "1. Setup Project"
    echo "2. Manage Project"
    echo "3. Help"
    echo "4. Exit"
    
    read -p "Enter your choice: " main_choice

    case $main_choice in
        1)
            print_separator
            setup_project_menu
            ;;
        2)
            print_separator
            manage_project_menu
            ;;
        3)
            print_separator
            help_menu
            ;;
        4)
            print_separator
            echo "Exiting..."
            print_separator
            exit 0
            ;;
        *)
            print_separator
            echo "Invalid choice. Exiting..."
            print_separator
            exit 1
            ;;
    esac
}

setup_project_menu() {
    echo "Setup Project:"
    echo "1. Install Project"
    echo "2. Uninstall Project"
    echo "3. Uninstall Dependencies"
    echo "4. Eject Project"
    echo "5. Setup Existing Project"
    echo "6. Install Dependencies"
    echo "7. Back to Main Menu"

    read -p "Enter your choice: " setup_choice

    case $setup_choice in
        1)
            print_separator
            ./scripts/install_project.sh
            main_menu
            ;;
        2)
            print_separator
            ./scripts/uninstall_project.sh
            main_menu
            ;;
        3)
            print_separator
            ./scripts/uninstall_dependencies.sh
            main_menu
            ;;
        4)
            print_separator
            npm run eject
            main_menu
            ;;
        5)
            print_separator
            ./scripts/setup_project.sh
            main_menu
            ;;
        6)
            print_separator
            npm install
            main_menu
            ;;
        7)
            print_separator
            main_menu
            ;;
        *)
            print_separator
            echo "Invalid choice. Returning to main menu..."
            main_menu
            ;;
    esac
}

manage_project_menu() {
    echo "Manage Project:"
    echo "1. Start Project"
    echo "2. Stop Project"
    echo "3. Test Project"
    echo "4. Build Project"
    echo "5. Back to Main Menu"

    read -p "Enter your choice: " manage_choice

    case $manage_choice in
        1)
            print_separator
            npm start
            ;;
        2)
            print_separator
            echo "Stopping the project (if running)..."
            # Add your logic to stop the project if applicable
            ;;
        3)
            print_separator
            npm test
            main_menu
            ;;
        4)
            print_separator
            npm run build
            main_menu
            ;;
        5)
            print_separator
            main_menu
            ;;
        *)
            print_separator
            echo "Invalid choice. Returning to main menu..."
            main_menu
            ;;
    esac
}

help_menu() {
    echo "Help:"
    echo "1. Setup Project - Options to install, uninstall, eject, and setup an existing project."
    echo "2. Manage Project - Options to start, stop, test, and build the project."
    echo "3. Back to Main Menu"

    read -p "Enter your choice: " help_choice

    case $help_choice in
        1)
            print_separator
            echo "Setup Project:"
            echo "1. Install Project - Installs the project by setting up the necessary environment and dependencies."
            echo "2. Uninstall Project - Uninstalls the project and removes all related files and dependencies."
            echo "3. Eject Project - Ejects the project configuration, giving you full control over the build configuration."
            echo "4. Setup Existing Project - Sets up an existing project by installing necessary dependencies and fixing vulnerabilities."
            print_separator
            main_menu
            ;;
        2)
            print_separator
            echo "Manage Project:"
            echo "1. Start Project - Starts the development server for the project."
            echo "2. Stop Project - Stops the project if it is running."
            echo "3. Test Project - Runs the test suite for the project."
            echo "4. Build Project - Builds the project for production."
            print_separator
            main_menu
            ;;
        3)
            print_separator
            main_menu
            ;;
        *)
            print_separator
            echo "Invalid choice. Returning to main menu..."
            print_separator
            main_menu
            ;;
    esac
}

main_menu
