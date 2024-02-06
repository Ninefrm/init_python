# Initializing a project in Python
These are the steps I normally follow to start a python project, I do it more as a reminder to myself.

## Prerequisites
1. Installation Pyenv & virtualenv:

    ### [MacOS](https://github.com/pyenv/pyenv 'Pyenv repo') 
    ```bash
    brew update
    brew install pyenv
    ```
    ### [Windows](https://github.com/pyenv-win/pyenv-win 'Pyenv-win') || Powershell
    ```bash
    Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"
    ```
## Init project
Having the folder/repository created
1. Set Python version, open your Terminal and execute the following commands:

    ### MacOS / Linux
    ```bash
    pyenv versions # Installed versions
        pyenv install -l #List python version list
        pyenv install <version> # Install your version if needed
    pyenv local <version> # Set the version needed
    python -m pip install –user virtualenv # Install virtualenv
    # Create a new virtual environment (replace 'env' with your desired environment name)
    python -m venv env
    # Activate the virtual environment
    source env/bin/activate
    ```
    ### Windows
    ```bash
    pyenv versions # Installed versions
        pyenv install -l #List python version list
        pyenv install <version> # Install your version if needed
    pyenv local <version> # Set the version needed
    python -m pip install –user virtualenv # Install virtualenv
    # Create a new virtual environment (replace 'env' with your desired environment name)
    python -m venv env
    # Activate the virtual environment
    .\env\Scripts\activate 
    ```
2. Init required folders:
    ### MacOS / Linux
    ```bash
    mkdir -p config container secrets source test utils && touch main.py requirements.txt config/__init__.py config/config.py source/__init__.py test/__init__.py utils/__init__.py container/deployment.yaml
    ```
    ### Windows || Powershell
    ```bash
    New-Item -ItemType File -Path main.py -Force; New-Item -ItemType File -Path requirements.txt -Force; New-Item -ItemType File -Path .\config\__init__.py -Force; New-Item -ItemType File -Path .\source\__init__.py -Force; New-Item -ItemType File -Path .\test\__init__.py -Force; New-Item -ItemType File -Path .\utils\__init__.py -Force
    ```

3. How I work with the folders:
    1. **config**: This directory is often used to store configuration files. These might include settings for different environments (like development, staging, and production), constants used throughout your application, or configuration for external services.
    A common way to structure this is to have Python files such as dev.py, prod.py, staging.py etc. which are loaded based on the current environment. Each file could contain settings relevant to that environment.

    2. **source**: This directory, often also named src, contains the main source code for your application. This could include different modules, packages, or standalone scripts, depending on the size and complexity of your application.
    In larger projects, the source directory often contains subdirectories corresponding to different parts of your application. For example, if you were building a web application, you might have subdirectories for routes, models, controllers, etc.

    3. **test**: As you might expect, this directory is used to contain tests. These could be unit tests, integration tests, or others. A common structure is to have a mirror of your source directory, but with each file replaced by a corresponding test file.
    So if you had a file source/routes/user.py, you might have a corresponding test file test/routes/test_user.py. This makes it easy to find the tests for a given piece of functionality.

    4. **utils**: This directory is usually used for utility scripts or modules that are used across your application. For example, you might have a utils.py file with common helper functions, or a logging.py file to set up logging consistently across your application.

4. Scripts
    ### MacOS / Linux
    ```bash
    chmod 700 py_init.sh
    pyenv install -l #List python version list
    py_init.sh unix <version>
    ```
    ### Windows || Powershell
    ```bash
    pyenv install -l #List python version list
    py_init.ps1 win <version>
    ```
