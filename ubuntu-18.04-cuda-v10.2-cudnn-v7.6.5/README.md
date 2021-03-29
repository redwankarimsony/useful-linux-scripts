# Installing cuda-10.2 and cudnn-7.6.5 for Ubuntu 18.04
The individual steps for installing cuda 10.2 and cudnn-7.6.5 in a Ubuntu 18.04 system is given below with necessary explanations. If your are stuck with any issues, feel free to create an issue here, I will quickly fix that. Thank you

## Installing with the Scripts:
If you just want a quick build build in a fresh machine, please use the scripts. Make sure that you have added executable permission to the scripts to run in your system. To do that, run the following:

```
chmod +x machine-configuration-part1.sh
chmod +x machine-configuration-part2.sh
```
After that you can run the scripts from their directory by 
```
./machine-configuration-part1.sh
```
After running the first script, your system will automatically restart. After the reboot run the second script with the following command
```
./machine-configuration-part2.sh
```


## Installing step-by-step:
### Step 1: Install Git if it is not there. 
```
sudo apt-get install git
git --version
```

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
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
sudo apt-key add /var/cuda-repo-10-2-local-10.2.89-440.33.01/7fa2af80.pub
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
echo "export PATH=/usr/local/cuda-10.2/bin${PATH:+:${PATH}}$" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc
source ~/.bashrc
sudo ldconfig
```

### Step 8: Installing cuDNN (runtime + developer + examples)
```
wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libcudnn7_7.6.5.32-1+cuda10.2_amd64.deb
wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libcudnn7-dev_7.6.5.32-1+cuda10.2_amd64.deb
wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/7.6.5.32/Production/10.2_20191118/Ubuntu18_04-x64/libcudnn7-doc_7.6.5.32-1%2Bcuda10.2_amd64.deb
sudo dpkg -i libcudnn7_7.6.5.32-1+cuda10.2_amd64.deb
sudo dpkg -i libcudnn7-dev_7.6.5.32-1+cuda10.2_amd64.deb
sudo dpkg -i libcudnn7-doc_7.6.5.32-1+cuda10.2_amd64.deb
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
