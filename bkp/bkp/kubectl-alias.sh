#!/bin/bash

##### GET PODS WITH NAMESPACE
if [ ${1} == "get" ] 
then
	/home/vagrant/k-workspace/kubectl-alias/_get_kind_withn.sh $1 $2 $3 $4
else
	echo "=======> Please do write commands in below mentioned format"
	echo "=======> example:"
	echo "                kdev get pods -n dit"
fi

##### GET PODS -ALL-NAMESPACES
if [ ${1} == "get" ] && [ ${3} == "--all-namespaces" ]  # kdev get pods --all-namespaces
then
	/home/vagrant/k-workspace/kubectl-alias/_get_kind_alln.sh $1 $2 $3
else
	echo "=======> Please do write commands in below mentioned format"
	echo "=======> example:"
	echo "		kdev get pods --all-namespaces"
fi

##### GET NODES ######
if [ ${1} == "get" ] && [ ${2} == "nodes" ] || [ ${2} == "node" ]
then
        /home/vagrant/k-workspace/kubectl-alias/_get_nodes.sh $1 $2
else
        echo "=======> Please do write commands in below mentioned format"
        echo "=======> example:"
        echo "          kdev get nodes"
fi

##### Describe Script
if [ ${1} == "describe" ]
then
	/home/vagrant/k-workspace/kubectl-alias/describe.sh $1 $2 $3 $4
elif [ ${1} != "get" ] && [ ${1} != "describe" ]
then
	echo "Please do write command in format"
	echo "ex:"
	echo "kdev describe pods -n dit nginx-deployment-67594d6bf6-cr9bg"
fi





