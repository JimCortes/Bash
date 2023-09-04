#!/bin/bash

# Initialize the environment name as empty
env=""

# Check if the user passed the environment name as an argument
while [[ $# -gt 0 ]]; do
    case "$1" in
        -n|--name)
            # If the user passed the name using -n or --name, assign the next argument to 'env'
            env="$2"
            shift 2
            ;;
        *)
            # For any other argument, ignore it
            shift
            ;;
    esac
done

# If 'env' is still empty, ask the user for the environment name
if [ -z "$env" ]; then
    read -p "Enter the name for the environment: " env
fi

# Check if 'env' is still empty; if so, display an error message and exit
if [ -z "$env" ]; then
    echo "Error: No environment name provided."
    exit 1
fi

# Create a Python virtual environment
python -m venv "$env"


activate () {
  /$env/bin/activate
}

activate