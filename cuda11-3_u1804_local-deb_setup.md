# [Linux Setup](https://www.tensorflow.org/install/gpu#linux_setup)

Install correct kernel header.

```bash
sudo apt-get install linux-headers-$(uname -r)
```

Install CUDA Toolkit 11.3 via debian local file (recommended for older versions).

```bash
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.3.0/local_installers/cuda-repo-ubuntu1804-11-3-local_11.3.0-465.19.01-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-11-3-local_11.3.0-465.19.01-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu1804-11-3-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda
sudo rm cuda-repo-ubuntu1804-11-3-local_11.3.0-465.19.01-1_amd64.deb
```

Install NVIDIA driver

```bash
#sudo apt-get install --no-install-recommends nvidia-driver-450
```

Reboot. Check that GPUs are visible using the command: nvidia-smi

```bash
#wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libnvinfer7_7.1.3-1+cuda11.0_amd64.deb
#sudo apt install ./libnvinfer7_7.1.3-1+cuda11.0_amd64.deb
#udo apt-get update
```

Install development and runtime libraries (~4GB)

```bash
#sudo apt-get install --no-install-recommends \
#cuda-11-0 \
#libcudnn8=8.0.4.30-1+cuda11.0  \
#libcudnn8-dev=8.0.4.30-1+cuda11.0
```

Install TensorRT. Requires that libcudnn8 is installed above.

```bash
#sudo apt-get install -y --no-install-recommends libnvinfer7=7.1.3-1+cuda11.0 \
#libnvinfer-dev=7.1.3-1+cuda11.0 \
#libnvinfer-plugin7=7.1.3-1+cuda11.0
```
