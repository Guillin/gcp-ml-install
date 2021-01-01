# Built on fast.ai script: https://github.com/fastai/courses/blob/master/setup/install-gpu.sh
# Script is designed to work with ubuntu 16.04 LTS

sudo apt-get update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install tmux build-essential gcc g++ make binutils
sudo apt-get --assume-yes install software-properties-common
sudo apt-get install htop
sudo apt-get install unzip

# download and install GPU drivers
# wget "http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.44-1_amd64.deb" -O "cuda-repo-ubuntu1604_8.0.44-1_amd64.deb"
# sudo dpkg -i cuda-repo-ubuntu1604_8.0.44-1_amd64.deb
# sudo apt-get update
# sudo apt-get -y install cuda
# sudo modprobe nvidia
# nvidia-smi

# install cudnn libraries
# wget "http://files.fast.ai/files/cudnn.tgz" -O "cudnn.tgz"
# tar -zxf cudnn.tgz
# cd cuda
# sudo cp lib64/* /usr/local/cuda/lib64/
# sudo cp include/* /usr/local/cuda/include/
# cd ~

# install Anaconda for current user
echo "installing conda"

mkdir downloads
cd downloads
wget "https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh" -O "Anaconda3-Linux-x86_64.sh"
bash "Anaconda3-Linux-x86_64.sh" -b
echo "export PATH=\"$HOME/anaconda3/bin:\$PATH\"" >> ~/.bashrc
export PATH="$HOME/anaconda3/bin:$PATH"
conda install -y bcolz
conda upgrade -y --all
cd -

echo
echo "creating datasci-env environment"
conda env create --file envs/datasci-env.yml
echo
echo "checking main libraries version installed"
echo
source activate datasci-env

python ds-versions.py

source deactivate datasci-env


echo
echo "creating deeplearn-env environment"
conda env create --file envs/deeplearn-env.yml

# install and configure theano
# pip install theano
# echo "[global]
# device = gpu
# floatX = float32
# [cuda]
# root = /usr/local/cuda" > ~/.theanorc

# install and configure tensorflow
# sudo apt-get install python-pip python-de # for Python 2.7
# sudo apt-get install libcupti-dev
# pip install tensorflow-gpu

# install and configure keras
# pip install keras==2.0.1
# mkdir ~/.keras
# echo '{
#     "image_dim_ordering": "th",
#     "epsilon": 1e-07,
#     "floatx": "float32",
#     "backend": "theano"
# }' > ~/.keras/keras.json

# install and configure pytorch
# pip install http://download.pytorch.org/whl/cu80/torch-0.1.12.post2-cp27-none-linux_x86_64.whl 
# pip install torchvision
# sudo apt-get install libhdf5-dev
# pip install h5py
# curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip
# unzip protoc-3.2.0-linux-x86_64.zip -d protoc3
# sudo mv protoc3/bin/protoc /usr/bin/protoc
# pip install lmdb

# configure jupyter
# jupyter notebook --generate-config
# jupass=`python -c "from notebook.auth import passwd; print(passwd())"`
# echo "c.NotebookApp.password = u'"$jupass"'" >> $HOME/.jupyter/jupyter_notebook_config.py
# echo "c.NotebookApp.ip = '*'
# c.NotebookApp.open_browser = False" >> $HOME/.jupyter/jupyter_notebook_config.py
# echo "If you setup firewall rules to access \"jupyter notebook\" on this VM then it will start Jupyter on port 8888"
# echo "If you get an error instead, try restarting your session so your $PATH is updated"

# sudo apt-get update
# mkdir code && cd code

echo
echo "Setup complete"