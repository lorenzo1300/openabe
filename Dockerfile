#Use base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

#Installation and update of needed packages
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git \ 
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
WORKDIR /project/openabe

#Compiling of the library
RUN . ./env 
RUN make


#Move to bench_scripts directory and compile C++ benchmark script
WORKDIR /project/bench_scripts
RUN chmod +x compile_bench.sh
RUN chmod +x bench.sh

#Compile C++ script at runtime
CMD ["./compile_bench.sh"]