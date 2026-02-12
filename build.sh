#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "=== Installing minimal packages ==="
pkg update -y
pkg install -y git cmake ninja clang make ocl-icd opencl-headers clinfo python

echo "=== Cloning / updating llama.cpp ==="
cd ~
if [ ! -d "llama.cpp" ]; then
  git clone https://github.com/ggerganov/llama.cpp.git
fi
cd llama.cpp
git pull

echo "=== Configuring minimal static OpenCL build ==="
rm -rf build
mkdir build && cd build

cmake .. \
  -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_SHARED_LIBS=OFF \
  -DGGML_MTMD=OFF \
  -DGGML_OPENCL=ON \
  -DGGML_OPENCL_EMBED_KERNELS=ON \
  -DGGML_OPENCL_USE_ADRENO_KERNELS=ON \
  -DLLAMA_BUILD_SERVER=OFF \
  -DLLAMA_BUILD_TESTS=OFF \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++

echo "=== Building (this builds llama-cli + required parts) ==="
ninja -j3

echo "=== List portable binary + wrapper ==="
mkdir -p ~/bin
cp bin/* ~/bin/.
chmod +x ~/bin/*

cd ~/bin
ls


