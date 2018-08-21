#!/bin/bash

K='kubectl'
KG='kubectl --kubeconfig=/home/vagrant/gcp-cluster/kube-config'

VERB=${1}
NODES=${2}

R=$(tput setaf 1)
G=$(tput setaf 2)
Y=$(tput setaf 3)
B=$(tput sgr0)
#B=$(tput blink)
NO=$(tput sgr0)

function line() {
        echo "${B}============================================================================================${NO}"
}

###### If verb matches GET and required NODES
if [ ${VERB} == "get" ] && [ ${NODES} == "nodes" ] || [ ${NODES} == "node" ]
then
  line
  echo "===== USE ${R}"k"${NO} =====> ${R}Single Master CLuster${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}Nodes${NO} "
  line
  ${K} get ${NODES}
  line
  echo "===== USE ${R}"kg"${NO} =====> ${R}Google Cloud CLuster${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}Nodes${NO} "
  line
  ${KG} get ${NODES}
  line
else
  echo "=======> Please do write commands in below mentioned format"
  echo "=======> example:"
  echo "              kdev get nodes"
fi
