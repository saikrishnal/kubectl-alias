#!/bin/bash

##### GET PODS WITH NAMESPACE
if [ ${1} == "get" ] && [ ${3} == "-n" ]  
then
	/home/vagrant/k-workspace/kubectl-alias/_get_kind_withn.sh $1 $2 $3 $4

##### GET PODS -ALL-NAMESPACES
elif [ ${1} == "get" ] && [ ${3} == "--all-namespaces" ]  # kdev get pods --all-namespaces
then
	/home/vagrant/k-workspace/kubectl-alias/_get_kind_alln.sh $1 $2 $3

##### GET NODES ######
elif [ ${1} == "get" ] && [ ${2} == "nodes" ] || [ ${2} == "node" ]
then
        /home/vagrant/k-workspace/kubectl-alias/_get_nodes.sh $1 $2

##### Describe Script
elif [ ${1} == "describe" ]
then
	/home/vagrant/k-workspace/kubectl-alias/_describe.sh $1 $2 $3 $4
fi





