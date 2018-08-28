#!/bin/bash
#-----------------------------------------------------------------------------------
# Copyright(C) Ezio's Kingdom
#-----------------------------------------------------------------------------------
# Process Name:      pre-kubectl-alias.sh
# Date Written:      08/28/2018
# Author:            Saikrishna Lakkavatri
# Shell:             bash
# Description:       This script will use kubectl arguments as a input and gets pods or deploy or svc anything that matches kind in kubernetes which includes whole PRE environmnet cluster
#
#------------------------------------------------------------------------------------

KCTL='kubectl'
CONFIG1='--kubeconfig=/home/vagrant/local-cluster/config'
CONFIG2='--kubeconfig=/home/vagrant/gcp-cluster/kube-config'

### VARIABLES
VERB=${1}
KIND=${2}
NAMESPACE=${4}
PODNAME=${5}

### COLORS
R=$(tput setaf 1)
Y=$(tput setaf 3)
C=$(tput setaf 6)
NO=$(tput sgr0)

#### MAIN SCRIPT
if [ ${VERB} == "get" ]
then

  for CONFIG in $CONFIG1 $CONFIG2
  do

  if [ $CONFIG == "$CONFIG1" ]; then
    ALIAS="k"
    ENVI="(LOCAL CLUSTER)"
  elif [ $CONFIG == "$CONFIG2" ]; then
    ALIAS="kg"
    ENVI="(GOOGLE CLUSTER)"
  fi

  if [ ${2} != 0 ] && [ -z ${3} ] || [ ${3} == "-o" ] || [ ${3} == "grep" ]; then                                       #<------- Start 1
    ##### DEFAULT VALUES #####
    echo "===== USE ${R}"${ALIAS}"${NO} =====>  ${C}PRE:${NO} ${Y}${ENVI}${NO} ===========> ${C}Verb:${NO} ${Y}${VERB}${NO}, ${C}Kind:${NO} ${Y}${KIND}${NO} "
    if [ -z ${3} ] || [ ${3} == "-o" ]; then                                                                                    #<----- Start 2
      if [ -z ${3} ]; then                                                                                                                      #<----- Start 3
        ${KCTL} ${CONFIG} get ${KIND}
      else
        ${KCTL} ${CONFIG} get ${KIND} -o wide
      fi                                                                                                                                        #<----- End3
    else
      if [ ! -z ${6} ]; then                                                                                                                    #<----- Start 3
        ${KCTL} ${CONFIG} get ${KIND} -o wide > /tmp/textoutput
        cat /tmp/textoutput | head -n 1
        cat /tmp/textoutput | grep ${4}
      else
        ${KCTL} ${CONFIG} get ${KIND} > /tmp/textoutput
        cat /tmp/textoutput | head -n 1
        cat /tmp/textoutput | grep ${4}
      fi                                                                                                                                        #<----- End 3
    fi                                                                                                                  #<- End 1 #<----- End 2
  elif [ ${1} != 0 ] && [ ${2} != 0 ] && [ ! -z ${3} ] && [ ${3} != "-o" ] && [ ${3} != "grep" ]; then                  #<-------- Start 0
    ##### WITH NAMESPACE #####
    if [ ${1} == "get" ] && [ ${3} == "-n" ] || [[ ${5} == "grep" ]]; then                                                        #<-------- Start 1
      echo "===== USE ${R}"${ALIAS}"${NO} =====>  ${C}PRE:${NO} ${Y}${ENVI}${NO} ===========> ${C}Verb:${NO} ${Y}${VERB}${NO}, ${C}Kind:${NO} ${Y}${KIND}${NO}, ${C}Namespace:${NO} ${Y}${NAMESPACE}${NO} "
      if [ -z ${5} ] || [ ${5} == "-o" ]; then                                                                                          #<----- Start 2
        if [ -z ${5} ]; then                                                                                                                    #<----- Start 3
          ${KCTL} ${CONFIG} get ${KIND} -n ${NAMESPACE}
        else
          ${KCTL} ${CONFIG} get ${KIND} -n ${NAMESPACE} -o wide
        fi                                                                                                                                      #<----- End 3
      else
        if [ ! -z ${8} ]; then                                                                                                                  #<----- Start 3
          ${KCTL} ${CONFIG} get ${KIND} -n ${NAMESPACE} -o wide > /tmp/textoutput
          cat /tmp/textoutput | head -n 1
          cat /tmp/textoutput | grep ${6}
        else
          ${KCTL} ${CONFIG} get ${KIND} -n ${NAMESPACE} > /tmp/textoutput
          cat /tmp/textoutput | head -n 1
          cat /tmp/textoutput | grep ${6}
        fi                                                                                                                                      #<----- End 3
      fi                                                                                                                        #<- End 1 #<----- End 2
    ##### ALL NAMESPACES #####
    elif [ ${1} == "get" ] && [ ${3} == "--all-namespaces" ] || [ ${4} == "grep" ]; then                                        #<-------- Start 1
      echo "===== USE ${R}"${ALIAS}"${NO} =====>  ${C}PRE:${NO} ${Y}${ENVI}${NO} ===========> ${C}Verb:${NO} ${Y}${VERB}${NO}, ${C}Kind:${NO} ${Y}${KIND}${NO}, ${C}Namespace:${NO} ${Y}all-namespaces${NO} "
      if [ -z ${4} ] || [ ${4} == "-o" ]; then                                                                                          #<----- Start 2
        if [ -z ${4} ]; then                                                                                                                    #<----- Start 3
          ${KCTL} ${CONFIG} get ${KIND} --all-namespaces
        else
          ${KCTL} ${CONFIG} get ${KIND} --all-namespaces -o wide
        fi                                                                                                                                      #<----- End 3
      else
        if [ ! -z ${7} ]; then                                                                                                                  #<----- Start 3
          ${KCTL} ${CONFIG} get ${KIND} --all-namespaces -o wide > /tmp/textoutput
          cat /tmp/textoutput | head -n 1
          cat /tmp/textoutput | grep ${5}
        else
          ${KCTL} ${CONFIG} get ${KIND} --all-namespaces > /tmp/textoutput
          cat /tmp/textoutput | head -n 1
          cat /tmp/textoutput | grep ${5}
        fi                                                                                                                                      #<----- End 3
      fi                                                                                                                                #<------ End 2
    fi                                                                                                                          #<------ End 1
  fi                                                                                                                    #<----------------- End 0
  done
  echo "${C}END _________________________________________________________________________________________________${NO}"
else
  echo ""
  echo "${C}=======>${NO} Please do run ${R}"kubectl-alias"${NO} command to see aliases which are already set ${C}<=======${NO}"
  echo ""

fi

