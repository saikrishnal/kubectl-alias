#!/bin/bash
#-----------------------------------------------------------------------------------
# Copyright(C) Ezio's Kingdom
#-----------------------------------------------------------------------------------
# Process Name:      pre-kubectl-alias.sh
# Date Written:      08/22/2018
# Author:            Saikrishna Lakkavatri
# Shell:             bash
# Description:       This script will use kubectl arguments as a input and gets pods or deploy or svc anything that matches kind in kubernetes which includes whole PRE environmnet cluster
#
#------------------------------------------------------------------------------------

KTL_CONFIG='/wscntrconf/kubernetes/kubectl --kubeconfig=******'

### VARIABLES
VERB=${1}
KIND=${2}
ALL_NAMESPACE=${3}
NAMESPACE=${4}
PODNAME=${5}

### COLORS
R=$(tput setaf 1)
G=$(tput setaf 2)
Y=$(tput setaf 3)
B=$(tput sgr0)
NO=$(tput sgr0)

#### LINE FUNCTIONS
function START() {
        echo "${G}START ===========================================================================================${NO}"
}
function END() {
        echo "${Y}END ============================================================================================${NO}"
}

#### MAIN SCRIPT
###### If verb matches GET and required KIND having a NAMESPACE
if [ ${VERB} == "get" ]
then
  START
  if [ ${1} != 0 ] && [ ${2} != 0 ] && [ -z ${3} ]; then
    ##### GET ANY KIND WITH DEFAULT VALUES #####
    echo "===== USE ${R}"kpre"${NO} =====> ${G} PRE:${NO} ${Y}(WSONL-PRE-RTP1)${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}${KIND}${NO} "
    ${KTL_CONFIG} get ${KIND}
  elif [ ${1} != 0 ] && [ ${2} != 0 ] && [ ! -z ${3} ] && [ -z ${5} ]; then
    ##### GET ANY KIND HAVING NAMESPACE
    if [ ${1} == "get" ] && [ ${3} == "-n" ]; then
      echo "===== USE ${R}"kpre"${NO} =====> ${G} PRE:${NO} ${Y}(WSONL-PRE-RTP1)${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}${KIND}${NO}, ${G}Namespace: ${Y}${NAMESPACE}${NO} "
      ${KTL_CONFIG} get ${KIND} -n ${NAMESPACE}
    ##### GET ANY KIND FOR ALL NAMESPACES
    elif [ ${1} == "get" ] && [ ${3} == "--all-namespaces" ]; then
      echo "===== USE ${R}"kpre"${NO} =====> ${G} PRE:${NO} ${Y}(WSONL-PRE-RTP1)${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}${KIND}${NO}, ${G}Namespace: ${Y}${ALL_NAMESPACE}${NO} "
      ${KTL_CONFIG} get ${KIND} ${ALL_NAMESPACE}
    fi
  fi
  END
else
  echo "=======> Please do run "kubectl-alias" command to see preset aliases"
fi

