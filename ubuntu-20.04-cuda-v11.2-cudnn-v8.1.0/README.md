# Installing cuda-11.2 and cudnn-8.1.0 for Ubuntu 20.04
The individual steps for installing cuda 11.2 and cudnn-8.1.0 in a Ubuntu 20.04 system is given below with necessary explanations. 

## Installing with the Scripts:
If you just want a quick build build in a fresh machine, please use the scripts. Make sure that you have added executable permission to the scripts to run in your system. To do that, run the following:

```
chmod +x machine-config-part1.sh
chmod +x machine-config-part2.sh
```
After that you can run the scripts from their directory by 
```
./machine-config-part1.sh
```
After running the first script, your system will automatically restart. After the reboot run the second script with the following command
```
./machine-config-part2.sh
```

### Step 1: Install Git if it is not there. 
```
sudo apt-get install git
git --version
```

## Installing step-by-step:

### Step 2: Install the necessary compiler packages.
`libssl-dev`: This package is part of the OpenSSL project's implementation of the SSL and TLS cryptographic protocols for secure communication over the Internet.<br>
`build-essential`: This package contains all the necessary stuffs to compile a c or c++ project from the source
```
sudo apt-get install build-essential libssl-dev
```


### Step 3: Download and install the cmake > 3.12 (Here version 3.15.2 )
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



### Step 4: Install CUDA 10.2 (Nvidia GPU only!)
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
### Step 6: Check the nVIDIA driver installation
After you have reboted system, check whether updated nVIDIA dirver is installed in your machine. 
```
nvidia-smi
```

### Step 7: Export cuda library to system \$PATH
```
echo "export PATH=/usr/local/cuda-11.2/bin${PATH:+:${PATH}}$" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-11.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc
source ~/.bashrc
sudo ldconfig
```

### Step 8: Installing cuDNN (runtime + developer + examples)
```
wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/8.1.0.77/11.2_20210127/Ubuntu20_04-x64/libcudnn8_8.1.0.77-1+cuda11.2_amd64.deb
wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/8.1.0.77/11.2_20210127/Ubuntu20_04-x64/libcudnn8-dev_8.1.0.77-1+cuda11.2_amd64.deb
wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/8.1.0.77/11.2_20210127/Ubuntu20_04-x64/libcudnn8-samples_8.1.0.77-1+cuda11.2_amd64.deb
sudo dpkg -i libcudnn8_8.1.0.77-1+cuda11.2_amd64.deb
sudo dpkg -i libcudnn8-dev_8.1.0.77-1+cuda11.2_amd64.deb
sudo dpkg -i libcudnn8-samples_8.1.0.77-1+cuda11.2_amd64.deb
```


### Step 9: Installing python3 and pip3
```
sudo apt-get -y install python3-pip
sudo python3 -m pip install --upgrade pip
```

### Step 10: Installing OpenCV
```
sudo apt-get -y install python3-opencv libopencv-dev libopencv-core-dev
sudo pip3 install opencv-python
```

### Step 11: Installing AAlexyAB/darknet (Additional)

```
git clone https://github.com/AlexeyAB/darknet
cd darknet
```
Please check your GPU model and based on your GPU model, uncomment the `ARCH` variable in the `Makefile`. After that you can run the following commands in the terminal to compile.
```
sed -i 's/OPENCV=0/OPENCV=1/' Makefile
sed -i 's/GPU=0/GPU=1/' Makefile
sed -i 's/CUDNN=0/CUDNN=1/' Makefile
sed -i 's/LIBSO=0/LIBSO=1/' Makefile
make
```
