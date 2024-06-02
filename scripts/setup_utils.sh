#!/bin/bash
# @Author: Ramiro Luiz Nunes
# @Date:   2024-05-30 22:22:29
# @Last Modified by:   Ramiro Luiz Nunes
# @Last Modified time: 2024-06-02 19:54:00

# Import the functions from utils.sh
source scripts/utils.sh

# Add .editorconfig
echo -e "${MAGENTA}Adding .editorconfig...${NC}"
cat <<EOL > .editorconfig
# EditorConfig is awesome: https://EditorConfig.org

# Top-most EditorConfig file
root = true

# Unix-style newlines with a newline ending every file
[*]
end_of_line = lf
insert_final_newline = true

# 2 space indentation for JavaScript and JSX
[*.{js,jsx}]
indent_style = space
indent_size = 2

# 2 space indentation for JSON and YAML
[*.{json,yml,yaml}]
indent_style = space
indent_size = 2

# 4 space indentation for other files
[*.{html,css,py}]
indent_style = space
indent_size = 4

# Markdown files
[*.md]
trim_trailing_whitespace = false
insert_final_newline = true
EOL

# Add .gitignore if it does not exist
if [ ! -f .gitignore ]; then
    echo -e "${MAGENTA}Adding .gitignore...${NC}"
    cat <<EOL > .gitignore
# dependencies
/node_modules

# production
/build

# misc
.DS_Store
.env.local
.env.development.local
.env.test.local
.env.production.local
npm-debug.log*
yarn-debug.log*
yarn-error.log*
EOL
fi
