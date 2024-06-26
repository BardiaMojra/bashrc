# [Linux Setup](https://www.tensorflow.org/install/gpu#linux_setup)

Add NVIDIA package repositories

    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
    sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
    sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
    sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
    sudo apt-get update

    wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64/nvidia-machine-learning-repo-ubuntu2004_1.0.0-1_amd64.deb

    sudo apt install ./nvidia-machine-learning-repo-ubuntu2004_1.0.0-1_amd64.deb
    sudo apt-get update

Install NVIDIA driver

    sudo apt-get install --no-install-recommends nvidia-driver-450

Reboot. Check that GPUs are visible using the command: nvidia-smi

    wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libnvinfer7_7.1.3-1+cuda11.0_amd64.deb
    sudo apt install ./libnvinfer7_7.1.3-1+cuda11.0_amd64.deb
    sudo apt-get update
Install development and runtime libraries (~4GB)

    sudo apt-get install --no-install-recommends \
    cuda-11-0 \
    libcudnn8=8.0.4.30-1+cuda11.0  \
    libcudnn8-dev=8.0.4.30-1+cuda11.0

Install TensorRT. Requires that libcudnn8 is installed above.

    sudo apt-get install -y --no-install-recommends libnvinfer7=7.1.3-1+cuda11.0 \
    libnvinfer-dev=7.1.3-1+cuda11.0 \
    libnvinfer-plugin7=7.1.3-1+cuda11.0
