#!/bin/bash

# Function to simulate typing effect
type_effect() {
  local message="$1"
  for (( i=0; i<${#message}; i++ )); do
    echo -n "${message:$i:1}"
    sleep 0.05
  done
  echo ""
}

# Exit immediately if a command exits with a non-zero status
set -e
set -u

# Print ASCII art banner & Welcome message
cat << "EOF"
[Your ASCII Art Banner Here]
EOF

type_effect "/// Pwnagotchi 'BUILD FROM SOURCE' sequence initiated..."

# Define the path to the pwnagotchi directory in the current directory
PWNAGOTCHI_DIR="./pwnagotchi"

# Check if the directory exists
if [ -d "$PWNAGOTCHI_DIR" ]; then
    type_effect "/// ROGUE DIRECTORY IDENTIFIED"
    sudo rm -r "$PWNAGOTCHI_DIR"
    type_effect "/// ROGUE DIRECTORY DESTROYED"
fi

# Clone the repository
git clone https://github.com/evilsocket/pwnagotchi.git
cd pwnagotchi
type_effect "/// TERMINAL ACCESS GRANTED"

# Replace MANIFEST.in & requirements.txt with fixed versions
type_effect "/// INJECTING 3RD EYE LAB'S MUTATED PAYLOAD"
wget -O MANIFEST.in https://raw.githubusercontent.com/3rdEyeLabs-io/pwnagotchi_File_Fixes/main/MANIFEST.in
wget -O requirements.txt https://raw.githubusercontent.com/3rdEyeLabs-io/pwnagotchi_File_Fixes/main/requirements.txt

# Remove previous virtual environment if it exists
if [ -d "venv" ]; then
    type_effect "/// DEACTIVATING VIRTUAL ENVIRONMENT"
    python3 -m venv venv
    source venv/bin/activate
    deactivate || true
    rm -rf venv
fi 

# Create a new virtual environment
type_effect "/// NOVEL VIRTUAL ENVIRONMENT CREATED"
python3 -m venv venv
source venv/bin/activate

type_effect "/// LOADING WEAPONRY"

# Install Python dependencies
pip uninstall -y mpi4py
pip install mpi4py --no-cache-dir

# Install system dependencies for macOS
type_effect "/// UPDATING SYSTEM AND INSTALLING DEPENDENCIES"
brew update
brew install python3 git screen libffi openssl libpcap

# Link OpenSSL libraries (macOS specific)
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

# Install Python dependencies from requirements.txt
type_effect "/// HITTING THE PIP"
python3 -m pip install --upgrade pip
pip install build wheel setuptools

# Install dependencies from requirements.txt individually (with version)
pip install pycryptodome==3.9.4
pip install requests==2.21.0
pip install PyYAML==5.3.1
pip install scapy==2.4.3
pip install gym==0.14.0
pip install scipy
pip install tensorflow
pip install stable-baselines==2.7.0
pip install inky==1.2.0
pip install smbus2==0.3.0
pip install Pillow==5.4.1
pip install spidev==3.4
pip install gast==0.2.2
pip install flask==1.0.2
pip install flask-cors==3.0.7
pip install flask-wtf==0.14.3
pip install dbus-python==1.2.12
pip install toml==0.10.0
pip install python-dateutil==2.8.1
pip install websockets==8.1

# Clean up __pycache__ directories and .pyc files with sudo
type_effect "/// CLEANING UP MESS"
sudo find . -name "__pycache__" -exec rm -rf {} +
sudo find . -name "*.pyc" -exec rm -f {} +

# Build Pwnagotchi
type_effect "/// SUMMONING PWNAGOTCHI..."
python3 -m build

# Check if the build was successful
if [ ! -f dist/*.whl ]; then
    type_effect "/// THE WHEEL WAS NEVER INVENTED..."
    exit 1
fi

# Install from the built wheel package
type_effect "/// WHEEL BE RIGHT BACK"
pip install dist/*.whl

# Clean up __pycache__ directories and .pyc files with sudo
type_effect "/// CLEANING UP MESS. . . AGAIN!!!"
sudo find . -name "__pycache__" -exec rm -rf {} +
sudo find . -name "*.pyc" -exec rm -f {} +

# Remove virtual environment
if [ -d "venv" ]; then
    type_effect "/// DEACTIVATING VIRTUAL ENVIRONMENT"
    deactivate || true
    rm -rf venv
fi

type_effect "/// IT'S PWNAGE TIME!!!(⌐■_■)"

# Ensure script terminates properly
exit 0
