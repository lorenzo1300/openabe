#Use base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

#Installation and update of needed packages
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y autoconf 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y m4 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libtool 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y g++ 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y cmake 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libgmp-dev 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libssl-dev 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y bison 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y flex 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y unzip 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libglib2.0-dev 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y doxygen 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3-setuptools 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3-dev 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pip 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y npm 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libboost-all-dev=1.71.0.0ubuntu2 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libgtest-dev 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nano 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y sudo
        
RUN sudo ldconfig

#Cloning of the repository
RUN git clone https://github.com/lorenzo1300/openabe.git 

WORKDIR /openabe/openabe

RUN bash -c ". ./env && make && make install"




#Move to bench_scripts directory and compile C++ benchmark script
WORKDIR /openabe/bench_scripts
RUN chmod +x compile_bench.sh && ./compile_bench.sh
RUN chmod +x bench.sh

WORKDIR /openabe/bench_scripts