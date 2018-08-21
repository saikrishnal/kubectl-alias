
#!/bin/bash

K='kubectl'
KG='kubectl --kubeconfig=/home/vagrant/gcp-cluster/kube-config'

VERB=${1}
KIND=${2}

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
if [ ${VERB} == "get" ] && [ ${KIND} == "nodes" ] || [ ${KIND} == "node" ] || [ ${KIND} == "deploy" ] || [ ${KIND} == "deployment" ] || [ ${KIND} == "svc" ] || [ ${KIND} == "service" ]
 || [ ${KIND} == "pods" ] || [ ${KIND} == "pod" ] || [ ${KIND} == "ingress" ] || [ ${KIND} == "ing" ]
  line
  echo "===== USE ${R}"k"${NO} =====> ${R}Single Master CLuster${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}Nodes${NO} "
  line
  ${K} get ${KIND}
  line
  echo "===== USE ${R}"kg"${NO} =====> ${R}Google Cloud CLuster${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}Nodes${NO} "
  line
  ${KG} get ${KIND}
  line
else
  echo "=======> Please do write commands in below mentioned format"
  echo "=======> example:"
  echo "              kdev get nodes"
fi
