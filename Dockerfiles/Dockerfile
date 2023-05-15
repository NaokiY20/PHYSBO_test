FROM ubuntu:20.04

# apt-get時、入力待ちをしなくなる。
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Tokyo

# Install some basic utilities
RUN apt-get update && apt-get upgrade -y \
 && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    build-essential \
    python3 \
    wget \
    python3-distutils \
    python3-pip \
    nano \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install ipykernel
RUN pip3 install numpy
RUN pip3 install pipenv
RUN pip3 install torch
RUN pip3 install scikit-learn
RUN pip3 install pandas
RUN pip3 install matplotlib
RUN pip3 install GPy
RUN pip3 install MLflow
RUN pip3 install physbo

# シンボリックリンク
RUN sudo ln -s /usr/bin/python3 /usr/bin/python

# Create a working directory
RUN mkdir /workspace
WORKDIR /workspace

RUN adduser --disabled-password --gecos '' --shell /bin/bash user \
    && chown -R user:user /workspace
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER user

# Set the default command to python3
CMD [ "/bin/bash" ]
#CMD ["ps"]