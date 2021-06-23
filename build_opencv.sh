#!/bin/bash

# config
_cv_version="3.4.9"


## config cmake
rm -rf build && mkdir build #&& cd build

cmake -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      --build ~/libs/opencv-${_cv_version}/build \
      ~/libs/opencv-${_cv_version}/opencv

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local/opencv/${_cv_version} \
      -D INSTALL_PYTHON_EXAMPLES=OFF \
      -D INSTALL_C_EXAMPLES=ON \
      -D OPENCV_EXTRA_MODULES_PATH=~/libs/opencv-${_cv_version}/opencv_contrib/modules \
      -D PYTHON_EXECUTABLE=$(which python) \
      -D BUILD_EXAMPLES=ON \
      -D BUILD_DOCS=ON \
      --build ~/libs/opencv-${_cv_version}/build \
      ~/libs/opencv-${_cv_version}/opencv

make -j8


# EOF
