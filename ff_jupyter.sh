#!/bin/bash
sudo apt-get update
sudo apt-get install -y jupyter
sudo jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root &
