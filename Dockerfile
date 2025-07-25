FROM debian:bullseye

RUN set -x \
    && apt update \
    && apt install -y \
        git \
        wget \
        build-essential \
        libncurses5-dev \
        zlib1g-dev \
        gawk \
        git \
        ccache \
        gettext \
        unzip \
        python3 \
        python3-distutils \
        python3-pip \
        sudo \
        libssl-dev \
        rsync \
        time \
        uuid-dev\
        tzdata \
    && rm -r /var/lib/apt/lists/*
ENV TZ='Asia/Shanghai'
# 设置工作目录
WORKDIR /openwrt
