# check the driver and CUDA installation
nvidia-smi


# Setup CUDA 10.2 path.
#Set the environment for cuda 10.0
# nano ~/.bashrc
echo "export PATH=/usr/local/cuda-11.2/bin${PATH:+:${PATH}}$" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-11.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc
#cat paths.txt >> ~/.bashrc
source ~/.bashrc
sudo ldconfig



# Installing cuDNN 
wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/8.1.0.77/11.2_20210127/Ubuntu20_04-x64/libcudnn8_8.1.0.77-1+cuda11.2_amd64.deb
wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/8.1.0.77/11.2_20210127/Ubuntu20_04-x64/libcudnn8-dev_8.1.0.77-1+cuda11.2_amd64.deb
wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/8.1.0.77/11.2_20210127/Ubuntu20_04-x64/libcudnn8-samples_8.1.0.77-1+cuda11.2_amd64.deb
sudo dpkg -i libcudnn8_8.1.0.77-1+cuda11.2_amd64.deb
sudo dpkg -i libcudnn8-dev_8.1.0.77-1+cuda11.2_amd64.deb
sudo dpkg -i libcudnn8-samples_8.1.0.77-1+cuda11.2_amd64.deb



# Installing python3 and pip3 (usually python3 is installed by default)
# sudo apt-get -y install python3
sudo apt-get -y install python3-pip
sudo python3 -m pip install --upgrade pip


# Installing OpenCV
sudo apt-get -y install python3-opencv libopencv-dev libopencv-core-dev
sudo pip3 install opencv-python


# Install YOLO using Cmake
# Clone
git clone https://github.com/AlexeyAB/darknet
cd darknet
sed -i 's/OPENCV=0/OPENCV=1/' Makefile
sed -i 's/GPU=0/GPU=1/' Makefile
sed -i 's/CUDNN=0/CUDNN=1/' Makefile
make




