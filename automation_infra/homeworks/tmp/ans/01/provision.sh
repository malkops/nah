#!/bin/bash
docker run -itd --name centos7 centos:7
docker run -itd --name fedora fedora:39
docker run -itd --name ubuntu malkops/pybuntu:i2204-py310

ansible-playbook -i tmp/ans/01/inventory/prod.yml tmp/ans/01/site.yml --vault-password-file tmp/ans/01/vault.pw

docker kill $(docker ps -qa) && docker rm $(docker ps -qa)
