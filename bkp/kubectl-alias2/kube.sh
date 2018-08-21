#!/bin/bash

K='kubectl'
KG='kubectl --kubeconfig=/home/vagrant/gcp-cluster/kube-config'

VERB=$1
KIND=$2
VAR1=$2
ALL_NAMESPACES=$3
NAMESPACE=$4
PODNAME=$5

R=$(tput setaf 1)
G=$(tput setaf 2)
Y=$(tput setaf 3)
B=$(tput sgr0)
#B=$(tput blink)
NO=$(tput sgr0)

function line() {
	echo "${B}============================================================================================${NO}"
}


##### If verb matches GET and all-namespaces
if [ ${VERB} == "get" ] && [ ${ALL_NAMESPACES} == "--all-namespaces" ] 
then
  if [ ${VERB} == "get" ] && [ ${ALL_NAMESPACES} == "--all-namespaces" ] 
  then
    line
    echo "==============> ${R}Single Master CLuster${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}${KIND}, ${G}Namespace: ${Y}ALL${NO} "
    line
    ${K} get ${KIND} ${ALL_NAMESPACES}
    line
    echo "===============> ${R}Google Cloud CLuster${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}${KIND}, ${G}Namespace: ${Y}ALL${NO} "
    line
    ${KG} get ${KIND} ${ALL_NAMESPACES}
    line
  else
    echo "=======> Please do write commands in below mentioned format"
    echo "=======> example:"
    echo "		kdev get pods --all-namespaces"
  fi
fi
###### If verb matches GET and has a namespace
if [ ${VERB} == "get" ]
then
  if [ ${VERB} == "get" ]
  then
    line
    echo "==============> ${R}Single Master CLuster${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}${KIND}, ${G}Namespace: ${Y}${NAMESPACE}${NO} "
    line
    ${K} get ${KIND} -n ${NAMESPACE}
    line
    echo "===============> ${R}Google Cloud CLuster${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}${KIND}, ${G}Namespace: ${Y}${NAMESPACE}${NO} "
    line
    ${KG} get ${KIND} -n ${NAMESPACE}
    line
  else
    echo "=======> Please do write commands in below mentioned format"
    echo "=======> example:"
    echo "		kdev get pods -n dit"
  fi
fi

###### If verb matches GET and required NODES
if [ ${VERB} == "get" ] && [ ${VAR1} == "nodes" ] || [ ${VAR1} == "node" ]
then
  if [ ${VERB} == "get" ] && [ ${VAR1} == "nodes" ] || [ ${VAR1} == "node" ]
  then
    line
    echo "==============> ${R}Single Master CLuster${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}${KIND}, ${G}Namespace: ${Y}${VAR1}${NO} "
    line
    ${K} get ${VAR1}
    line
    echo "===============> ${R}Google Cloud CLuster${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}${KIND}, ${G}Namespace: ${Y}${VAR1}${NO} "
    line
    ${KG} get ${VAR1}
    line
  else
    echo "=======> Please do write commands in below mentioned format"
    echo "=======> example:"
    echo "		kdev get nodes"
  fi
fi




