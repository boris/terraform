#!/bin/bash
set -e 

ask(){
    read -p 'Environment: ' environment
    read -p 'Service Name: ' service
    read -p 'Region: ' region
}

main(){
    ask
    mkdir ./$environment/$region/$service
    cp -a common/* $environment/$region/$service
}

main
