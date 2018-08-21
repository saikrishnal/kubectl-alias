#!/bin/bash

if [ ${1} != 0 ] && [ ${2} != 0 ] && [ ${3} != 0 ]; then
##### GET PODS WITH NAMESPACE
	if [ ${1} == "get" ] && [ ${3} == "-n" ]; then
		/home/vagrant/k-workspace/kubectl-alias/_get_kind_withn.sh $1 $2 $3 $4
	
##### GET PODS -ALL-NAMESPACES
	elif [ ${1} == "get" ] && [ ${3} == "--all-namespaces" ]; then  # kdev get pods --all-namespaces
		/home/vagrant/k-workspace/kubectl-alias/_get_kind_alln.sh $1 $2 $3
	fi
fi


if [ ${1} != 0 ] && [ ${2} != 0 ] && [ -z ${3} ]; then
##### GET NODES ######
	if [ ${1} == "get" ] && [ ${2} == "nodes" ] || [ ${2} == "node" ]; then
        /home/vagrant/k-workspace/kubectl-alias/_get_nodes.sh $1 $2

##### GET DEFAULTS #####    
    elif [ ${1} == "get" ]; then
        /home/vagrant/k-workspace/kubectl-alias/_get_defaults.sh $1 $2
    fi
fi

##### Describe Script
if [ ${1} == "describe" ]
then
	/home/vagrant/k-workspace/kubectl-alias/_describe.sh $1 $2 $3 $4
fi





