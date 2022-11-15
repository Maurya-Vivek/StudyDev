#!/bin/bash
#this is a test script for POC of Docker file run time variable overridding the cmd arguments
set -x
while $1
do
    echo "send sigtem to end.."
    sleep 5
    echo "Printing second and third argument i.e.: $2 & $3"
done