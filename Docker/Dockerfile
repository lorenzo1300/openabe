#Use base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

#Installation and update of needed packages
RUN apt-get update --fix-missing
RUN apt install -y git 
RUN apt install -y build-essential 
RUN apt install -y wget 
RUN apt install -y autoconf 
RUN apt install -y m4 
RUN apt install -y libtool 
RUN apt install -y g++ 
RUN apt install -y cmake 
RUN apt install -y libgmp-dev 
RUN apt install -y libssl-dev 
RUN apt install -y bison 
RUN apt install -y flex 
RUN apt install -y unzip 
RUN apt install -y libglib2.0-dev 
RUN apt install -y doxygen 
RUN apt install -y python3-setuptools 
RUN apt install -y python3-dev 
RUN apt install -y python3-pip 
RUN apt install -y nodejs 
RUN apt install -y npm 
RUN apt install -y libboost-all-dev=1.71.0.0ubuntu2 
RUN apt install -y libgtest-dev 
RUN apt install -y nano 
RUN apt install -y sudo
        
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