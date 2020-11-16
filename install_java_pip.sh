#!/bin/bash

sudo apt update -y

sudo apt search openjdk

# Pick one option and install it:
sudo apt install openjdk-8-jdk -y

# Install pip3
sudo apt install python3-pip