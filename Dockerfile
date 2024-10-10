#Use base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

#Installation and update of needed packages
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y git \ 
        build-essential \
        wget \
        autoconf \
        m4 \
        libtool \
        g++ \
        cmake \
        libgmp-dev \
        libssl-dev \
        bison \
        flex \
        unzip \
        libglib2.0-dev \
        doxygen \
        python3-setuptools \
        python3-dev \
        python3-pip \
        nodejs \
        npm \
        libboost-all-dev=1.71.0.0ubuntu2 \
        libgtest-dev \
        nano \
        sudo
        
RUN sudo ldconfig

#Cloning of the repository
RUN git clone https://github.com/lorenzo1300/openabe.git /project

#Move on the library directory
WORKDIR /project/OpenABE

#Compiling of the library
RUN . ./env && make

#Running test
RUN make tests

#Move to bench_scripts directory
WORKDIR /project/bench_scripts
 
#Compile C++ script at runtime
CMD ["bash"]