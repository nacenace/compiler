FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y tzdata \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    g++ \
    cmake \
    make \
    build-essential \
    zlib1g-dev && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /work/cpp/build

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    pkg-config \
    uuid-dev \
    git \
    flex \
    bison \
    unzip && \
    apt-get purge -y --auto-remove \
    pkg-config \
    uuid-dev \
    unzip && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gpg-agent \
    lsb-release \
    wget \
    software-properties-common && \
    wget https://apt.llvm.org/llvm.sh && \
    chmod +x llvm.sh && \
    ./llvm.sh 9 && \
    echo -e "export PATH=\$PATH:/usr/lib/llvm-9/bin" >> ~/.bashrc && \
    source ~/.bashrc && \
    apt-get purge -y --auto-remove \
    gpg-agent \
    lsb-release \
    wget \
    software-properties-common && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends libedit-dev

RUN git clone  https://github.com/fmtlib/fmt.git && cd fmt && cmake . && make && make install

WORKDIR /usr/src/app

CMD bash
