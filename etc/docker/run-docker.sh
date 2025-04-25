#!/bin/bash

if [[ ! -d certs ]]
then
    mkdir certs
    cd certs/
    if [[ ! -f localhost.pfx ]]
    then
        dotnet dev-certs https -v -ep localhost.pfx -p c864e13f-d7c1-430a-9a12-99224f8a9fc2 -t
    fi
    cd ../
fi

docker-compose up -d
