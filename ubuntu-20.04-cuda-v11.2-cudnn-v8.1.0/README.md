# Installing cuda-11.2 and cudnn-8.1.0 for Ubuntu 20.04

### Install Git if it is not there. 
```
sudo apt-get install git
git --version
```


###  Install the necessary compiler packages.
`libssl-dev`: This package is part of the OpenSSL project's implementation of the SSL and TLS cryptographic protocols for secure communication over the Internet.
`build-essential`: This package contains all the necessary stuffs to compile a c or c++ project from the source
`sudo apt-get install build-essential libssl-dev`


### Download and install the cmake > 3.12 (Here version 3.15.2 )
Download >> unzip >> bootstrap >> build >> install
```
wget https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2.tar.gz
tar -zxvf cmake-3.15.2.tar.gz
cd cmake-3.15.2
./bootstrap
make
sudo make install
cd ..
```



### Install CUDA 10.2 (Nvidia GPU only!)
*NOTE:* YOLO Darknet from AlexeyAB repository can be used with CUDA 11.2
```
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.2.2/local_installers/cuda-repo-ubuntu2004-11-2-local_11.2.2-460.32.03-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-11-2-local_11.2.2-460.32.03-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-2-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda
sudo reboot
```
