#!/bin/bash

# Adding colors
R=$(tput setaf 1)
G=$(tput setaf 2)
NO=$(tput sgr0)


# Teting to see if the word exists in .bashrc
WORD1=$(cat ~/.bashrc | grep -c "kdev")
WORD2=$(cat ~/.bashrc | grep -c "kg")

# If word found then it will give 1
if [ ${WORD1} -eq 1 ] && [ ${WORD2} -eq 1 ] 
then
  echo "------------------------------------------------------------"
  echo "Aliases are already set"
  echo "Use ${R} k ${NO} for kubectl local cluster"
  echo "Use ${R} kg ${NO} for kubectl Google Cloud Cluster"
  echo "Use ${R} kdev ${NO} for kubectl Total Dev Cluster"
  echo "------------------------------------------------------------"
else
  echo "alias k='kubectl'" >> ~/.bashrc
  echo "alias set for ${R}k ${G}= kubectl ${NO}"
  echo "alias kg='kubectl --kubeconfig=/home/vagrant/gcp-cluster/kube-config'" >> ~/.bashrc
  echo "alias set for ${R}kg ${G}='kubectl --kubeconfig=/home/vagrant/gcp-cluster/kube-config'${NO}"
  echo "alias kdev='/home/vagrant/k-workspace/kubectl-alias/kube.sh'" >> ~/.bashrc
  echo "alias set for ${R}kdev ${G}='/home/vagrant/k-workspace/kubectl-alias/kube.sh'${NO}"
  echo "aliases are set now use k or kg or kdev"
  bash
fi
