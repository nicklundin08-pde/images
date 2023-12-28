#! /bin/bash
set -e 

DIR=$(pwd)
echo $DIR

cd $DIR/ubuntu/001_nvim/ && chmod +x publish.sh && ./publish.sh
