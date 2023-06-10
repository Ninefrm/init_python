# Check the arguments
param (
    [Parameter(Mandatory=$true)][string]$sys,
    [Parameter(Mandatory=$true)][string]$version
)

if ($sys -eq 'win') {
    # Check if pyenv is installed
    if (-not (Get-Command pyenv -ErrorAction SilentlyContinue)) {
        Write-Output 'Pyenv is not installed. Please run the prerequisite steps'
        return
    }

    # Init project on PowerShell
    pyenv install $version # Install desired Python version
    pyenv local $version # Set the desired Python version
    python -m pip install virtualenv # Install virtualenv

    # Create a new virtual environment (replace 'env' with your desired environment name)
    python -m venv env

    # Activate the virtual environment
    .\env\Scripts\activate

    # Init required folders on PowerShell
    New-Item -ItemType File -Path main.py -Force
    New-Item -ItemType File -Path requirements.txt -Force
    New-Item -ItemType File -Path .\config\__init__.py -Force
    New-Item -ItemType File -Path .\source\__init__.py -Force
    New-Item -ItemType File -Path .\test\__init__.py -Force
    New-Item -ItemType File -Path .\utils\__init__.py -Force
} elseif ($sys -eq 'unix') {
    Write-Output 'Run py_init.sh version'
} else {
    Write-Output 'Invalid argument. Please use win or unix'
}