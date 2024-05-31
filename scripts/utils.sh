#!/bin/bash
# @Author: Ramiro Luiz Nunes
# @Date:   2024-05-30 22:30:52
# @Last Modified by:   Ramiro Luiz Nunes
# @Last Modified time: 2024-05-30 22:36:42

# Utility functions

# Function to check if a command exists
command_exists () {
    type "$1" &> /dev/null ;
}
