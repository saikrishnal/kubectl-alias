#!/bin/bash


function backup_folder () {
	if [ -d $1 ] 
	then
		BKP="${1}/bkp/$(basename ${1})-$(date +%F)-$(date +%T)"
		echo "Backing up Kubectl-alias Folder"
		mkdir -p "${BKP}"
		cp $1/*sh ${BKP}
	fi
}

backup_folder /home/vagrant/k-workspace/kubectl-alias

if [ $? -eq 0 ]
then
	echo "Backup Done"
	echo "Backup name: `ls -l | tail -2 | head -1 | awk '{print $9}'`"
fi
