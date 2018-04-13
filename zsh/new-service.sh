#!/bin/bash
set -e 

ask(){
    read -p 'Environment: ' environment
    read -p 'Service Name: ' service
}

main(){
    ask
    mkdir ./$environment/$service
    cp -a common/* $environment/$service
}

main
