FROM  	centos:7.2.1511
# RUN yum update -y
RUN yum groupinstall "Development Tools" -y    
RUN yum install wget -y
RUN curl -O https://ftp.gnu.org/gnu/gcc/gcc-8.2.0/gcc-8.2.0.tar.gz
RUN tar xzf gcc-8.2.0.tar.gz
WORKDIR  /gcc-8.2.0
RUN ./contrib/download_prerequisites
RUN cd ..
RUN mkdir gcc-build
RUN cd gcc-build
RUN ../gcc-8.2.0/configure                           \
    --enable-threads=posix                           \
    --disable-multilib                               \
    --enable-languages=c,c++,lto
RUN make -j 8
# # (Go make a cup of ice tea :)
# RUN make check
RUN make install