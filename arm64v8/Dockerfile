FROM arm64v8/ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory in the container
WORKDIR /usr/src/dev

# Copy the Bash script into the container
COPY shellupdate.sh .

# Make sure the script is executable
RUN chmod +x shellupdate.sh

RUN apt update -y

RUN apt upgrade -y

RUN apt install pip -y

RUN pip install ipython --quiet

RUN apt-get update && \
  apt-get install -y gcc python-dev-is-python3 libkrb5-dev && \
  apt-get install python3-pip -y && \
  pip3 install --upgrade pip --quiet && \
  pip3 install --upgrade virtualenv --quiet && \
  pip3 install pywinrm[kerberos] --quiet && \
  apt install krb5-user -y && \ 
  pip3 install pywinrm --quiet && \
  pip3 install ansible --quiet

RUN apt install nano

###################################
# Prerequisites

# Update the list of packages
RUN apt-get update

# Install pre-requisite packages.
RUN apt-get install -y wget apt-transport-https software-properties-common

# Download the Microsoft repository keys
RUN wget -q https://github.com/PowerShell/PowerShell/releases/download/v7.4.1/powershell-7.4.1-linux-arm64.tar.gz

# Register the Microsoft repository keys
RUN mkdir -p /opt/powershell

RUN tar -xvf powershell-7.4.1-linux-arm64.tar.gz -C /opt/powershell

# Delete the Microsoft repository keys file
RUN export PATH=$PATH:/opt/powershell

RUN echo 'export PATH=$PATH:/opt/powershell' >> ~/.bashrc

RUN apt install -y openssh-client

RUN apt install -y openssh-server

RUN apt-get install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

RUN apt install -y curl

RUN curl -O https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-aarch64.sh

RUN bash Anaconda3-2024.02-1-Linux-aarch64.sh -b -p ~/anaconda3

RUN rm Anaconda3-2024.02-1-Linux-aarch64.sh

RUN ./shellupdate.sh