#!/bin/bash

K='kubectl'
KG='kubectl --kubeconfig=/home/vagrant/gcp-cluster/kube-config'

VERB=${1}
KIND=$2
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

if [ ${VERB} == "get" ]
then
  line	
  echo "===== USE ${R}"k"${NO} ======> ${R}Single Master CLuster${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}${KIND}, ${G}Namespace: ${Y}${NAMESPACE}${NO} "
  line  
  ${K} get ${KIND} -n ${NAMESPACE}
  line	
  echo "===== USE ${R}"kg"${NO} ======> ${R}Google Cloud CLuster${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}${KIND}, ${G}Namespace: ${Y}${NAMESPACE}${NO} "
  line
  ${KG} get ${KIND} -n ${NAMESPACE}
  line
else
  echo "=======> Please do write commands in below mentioned format"
  echo "=======> example:"
  echo "		kdev get pods -n dit"
fi
