#!/bin/bash

# Check the arguments
sys=$1
version=$2

if [ "$sys" = "unix" ]; then
    # Check if pyenv is installed
    if ! command -v pyenv &> /dev/null; then
        echo 'Pyenv is not installed. Please run the prerequisite steps'
        exit 1
    fi

    # Init project on Unix
    pyenv install $version # Install desired Python version
    pyenv local $version # Set the desired Python version
    python -m pip install virtualenv # Install virtualenv

    # Create a new virtual environment (replace 'env' with your desired environment name)
    python -m venv env

    # Activate the virtual environment
    echo 'please run:'
    echo 'source env/bin/activate'

    # Init required folders on Unix
    mkdir -p config source test utils && touch main.py requirements.txt config/__init__.py source/__init__.py test/__init__.py utils/__init__.py
elif [ "$sys" = "win" ]; then
    echo 'Run py_init.ps1 version'
else
    echo 'Invalid argument. Please use win or unix'
fi
