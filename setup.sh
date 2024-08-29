#!/bin/bash

# Install Python (if not already installed)
if ! command -v python3 &>/dev/null; then
    echo "Python3 is not installed. Installing Python3..."
    sudo apt-get update
    sudo apt-get install -y python3 python3-pip
else
    echo "Python3 is already installed."
fi

# Ensure pip is up to date
echo "Upgrading pip..."
python3 -m pip install --upgrade pip

# Install virtualenv to manage Python environments
echo "Installing virtualenv..."
pip install virtualenv

# Set up a Python virtual environment in your project directory
echo "Creating a virtual environment..."
python3 -m venv venv

# Activate the virtual environment
echo "Activating the virtual environment..."
source venv/bin/activate

# Install necessary Python packages from requirements.txt (if it exists)
if [ -f "requirements.txt" ]; then
    echo "Installing packages from requirements.txt..."
    pip install -r requirements.txt
else
    echo "No requirements.txt found. Skipping package installation."
fi

# Clone additional repositories into the Codespace workspace
echo "Cloning additional repositories..."
# Example: Replace these with your repositories
# git clone https://github.com/username/repository1.git
# git clone https://github.com/username/repository2.git

# Set up any additional configuration or tooling
echo "Setting up additional configurations..."

# Example: Setting up pre-commit hooks
if [ -f ".pre-commit-config.yaml" ]; then
    echo "Installing pre-commit hooks..."
    pip install pre-commit
    pre-commit install
fi

# Custom setup (Add any other necessary commands here)

# Set VS Code to use the dark modern theme
echo "Setting VS Code theme to 'Dark Modern'..."

# Ensure the .vscode directory exists
mkdir -p .vscode

# Write the settings.json file with the preferred theme
cat > .vscode/settings.json <<EOL
{
    "workbench.colorTheme": "Dark Modern",
    "editor.fontFamily": "'Courier New', monospace",
    "editor.fontSize": 14,
    "editor.lineHeight": 22,
    "editor.fontLigatures": false
}
EOL

echo "Setup complete. Your development environment is ready!"
