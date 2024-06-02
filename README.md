# React Frontend Core

## Getting Started

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Table of Contents

- [React Frontend Core](#react-frontend-core)
  - [Getting Started](#getting-started)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
    - [Setup Project](#setup-project)
    - [Manage Project](#manage-project)
  - [Features](#features)
  - [Contributing](#contributing)
  - [License](#license)

## Installation

1. **Clone the repository:**
    ```bash
    git clone git@github.com:ramironunes/react-frontend-core.git
    cd react-frontend-core
    ```

2. **Grant execute permissions to the scripts:**
    ```bash
    chmod +x scripts/*.sh
    ```

3. **Run the setup script:**
    ```bash
    ./scripts/manage_project.sh
    ```

   Follow the interactive menu to set up the project.

## Usage

The `manage_project.sh` script provides an interactive way to manage the project. It has two main sections: Setup Project and Manage Project.

### Setup Project

Use this section for initial project setup and maintenance tasks.

1. **Install Project:**
   - Installs the project by setting up the necessary environment and dependencies.
   - Run this if you are setting up the project for the first time.

2. **Uninstall Project:**
   - Uninstalls the project and removes all related files and dependencies.
   - Use this to clean up the project from your system.

3. **Eject Project:**
   - Ejects the project configuration, giving you full control over the build configuration.
   - Note: This is a one-way operation. Once you eject, you can’t go back.

4. **Setup Existing Project:**
   - Sets up an existing project by installing necessary dependencies and fixing vulnerabilities.
   - Use this if you have cloned the project and need to prepare it for development.

### Manage Project

Use this section for everyday development tasks.

1. **Start Project:**
   - Starts the development server for the project.
   - Open [http://localhost:3000](http://localhost:3000) to view it in the browser.
   - The page will reload if you make edits. You will also see any lint errors in the console.

2. **Stop Project:**
   - Stops the project if it is running.
   - This option is currently a placeholder and may require manual stopping depending on your environment.

3. **Test Project:**
   - Runs the test suite for the project.
   - Use this to ensure your changes do not break the project.

4. **Build Project:**
   - Builds the project for production.
   - Use this when you are ready to deploy the project.

## Features

- Modular structure
- Docker support
- Basic CI setup with GitHub Actions
- Interactive management script for easy project setup and operations

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
