# update the system
sudo apt-get update
sudo apt-get -y upgrade


# Install Git if it is not there. 
sudo apt-get install git
git --version


# Install the libssl-dev package
# This package is part of the OpenSSL project's implementation of the SSL and TLS cryptographic protocols for secure communication over the Internet.
# It contains development libraries, header files, and manpages for libssl and libcrypto.
# Install the build-essential to specifiy the c and c++ compileers
sudo apt-get install build-essential libssl-dev 

# Tutorial From https://vitux.com/how-to-install-cmake-on-ubuntu-18-04/
# Download and install the cmake > 3.12 (I am using version 3.16 )
wget https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2.tar.gz
tar -zxvf cmake-3.15.2.tar.gz
cd cmake-3.15.2
#compile and install CMake:
./bootstrap
make
sudo make install
cd .. 



# Install CUDA 10.2 (Nvidia GPU only!)
# NOTE: YOLO Darknet from AlexeyAB repository can be compiled with either cuda 10.2 or 11.2
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600

wget https://developer.download.nvidia.com/compute/cuda/11.2.2/local_installers/cuda-repo-ubuntu2004-11-2-local_11.2.2-460.32.03-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-11-2-local_11.2.2-460.32.03-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-2-local/7fa2af80.pub

# update the system
sudo apt-get update
# install cuda
sudo apt-get -y install cuda

# restart the system
sudo reboot





