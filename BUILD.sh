#!/bin/zsh

# Print ASCII art banner
cat << "EOF"
╔╦╗┬ ┬┬┬─┐┌┬┐  ╔═╗┬ ┬┌─┐  ╦  ┌─┐┌┐ ┌─┐  ╔═╗┬─┐┌─┐┌─┐┌─┐┌┐┌┌┬┐┌─┐
 ║ ├─┤│├┬┘ ││  ║╣ └┬┘├┤   ║  ├─┤├┴┐└─┐  ╠═╝├┬┘├┤ └─┐├┤ │││ │ └─┐
 ╩ ┴ ┴┴┴└──┴┘  ╚═╝ ┴ └─┘  ╩═╝┴ ┴└─┘└─┘  ╩  ┴└─└─┘└─┘└─┘┘└┘ ┴ └─┘
╔╦╗┬ ┬┌─┐  ╔═╗┬ ┬┌┐┌┌─┐┌─┐┌─┐┌┬┐┌─┐┬ ┬┬  ╦┌┬┐┌─┐┌─┐┌─┐          
 ║ ├─┤├┤   ╠═╝││││││├─┤│ ┬│ │ │ │  ├─┤│  ║│││├─┤│ ┬├┤           
 ╩ ┴ ┴└─┘  ╩  └┴┘┘└┘┴ ┴└─┘└─┘ ┴ └─┘┴ ┴┴  ╩┴ ┴┴ ┴└─┘└─┘          
╔╗ ┬ ┬┬┬  ┌┬┐┌─┐┬─┐  ╔╦╗┌─┐┌─┐┬                                 
╠╩╗│ │││   ││├┤ ├┬┘   ║ │ ││ ││                                 
╚═╝└─┘┴┴─┘─┴┘└─┘┴└─   ╩ └─┘└─┘┴─┘                               

EOF

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

# Welcome message

type_effect "/// Pwnagotchi 'BUILD FROM SOURCE' sequence initiated..."

# Define the path to the pwnagotchi directory in the current directory
PWNAGOTCHI_DIR="./pwnagotchi"

# Check if the directory exists
if [ -d "$PWNAGOTCHI_DIR" ]; then
    type_effect "/// ROGUE DIRECTORY IDENTIFIED"
    sudo rm -r "$PWNAGOTCHI_DIR"
    type_effect "/// ROGUE DIRECTORY DESTROYED"
else
    type_effect "/// NO ROGUE DIRECTORY"
fi

# Clone the Pwnagotchi repository and navigate into it
type_effect "/// CLONING PWNAGOTCHI REPOSITORY"
git clone https://github.com/evilsocket/pwnagotchi.git 
cd pwnagotchi
type_effect "/// TERMINAL ACCESS GRANTED"

# Replace MANIFEST.in with 3rd Eye Lab's modded version
type_effect "/// INJECTING 3RD EYE LAB'S MUTATED PAYLOAD"
wget -O MANIFEST.in https://raw.githubusercontent.com/3rdEyeLabs-io/pwnagotchi_File_Fixes/main/MANIFEST.in

# Inject clean requirements.txt
# Replace MANIFEST.in with 3rd Eye Lab's modded version
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

# PIP install of mpi4py
pip uninstall -y mpi4py
pip install mpi4py --no-cache-dir

# Install system dependencies with sudo to avoid multiple password prompts
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sudo apt install -y python3 python3-setuptools python3-wheel python3-pip git screen libffi-dev libssl-dev libpcap-dev build-essential gfortran libopenblas-dev liblapack-dev libatlas-base-dev libdbus-1-dev libglib2.0-dev libfreetype6-dev libpng-dev libbz2-dev zlib1g-dev liblzma-dev wget python3-dev libxml2-dev libxslt1-dev libreadline-dev libsqlite3-dev curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libgdbm-dev libc6-dev libdb-dev libbz2-dev liblzma-dev libxml2-dev libxslt1-dev libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev xz-utils tk-dev libgdbm-dev libc6-dev libdb-dev openmpi-bin libopenmpi-dev
sudo apt purge python3-numpy -y  # Remove existing package
sudo apt install --reinstall python3-numpy -y  # Reinstall with clean options

# Force reinstall numpy using pip
#pip install --force-reinstall numpy

type_effect "/// Dum(b)Py INSTALLED"

# PIP install of NumPy and additional dependencies
type_effect "/// HITTING THE PIP"
python3 -m pip install --upgrade pip
pip install build wheel setuptools

# Install dependencies from requirements.txt individually (no version)
#pip install pycryptodome
#pip install requests
#pip install PyYAML
#pip install scapy
#pip install gym
pip install scipy
#pip install stable-baselines
pip install tensorflow
#pip install tensorflow-estimator
#pip install tweepy
#pip install file-read-backwards
#pip install numpy
#pip install inky
#pip install smbus2
#pip install Pillow
#pip install spidev
#pip install gast
#pip install flask
#pip install flask-cors
#pip install flask-wtf
#pip install dbus-python
#pip install toml
#pip install python-dateutil
#pip install websockets

# Install dependencies from requirements.txt individually (with version)

pip install pycryptodome==3.9.4
pip install requests==2.21.0
pip install PyYAML==5.3.1
pip install scapy==2.4.3
pip install gym==0.14.0
#pip install scipy==1.3.1
pip install stable-baselines==2.7.0
#pip install tensorflow==1.13.1
pip install tensorflow-estimator==1.14.0
pip install tweepy==3.7.0
pip install file-read-backwards==2.0.0
#pip install numpy==1.20.2
#pip install numpy==1.17.2
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

# (OR) Install fron setup.py (NOT RECOMMENDED - comment pip install dist/*.whl)
#python3 setup.py install

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
