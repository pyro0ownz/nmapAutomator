#!/bin/bash
####################################################################################################################################
## This script was created to be used in the oscp exam to save time and to automate nmapautomator that only scans 1 host at a time##
####################################################################################################################################
#                                                                                                                                 ##
#I do not own nmap automator it is not my tool. This is a supplimentary script used to save time on the exam for 30 minute scans. ##
####################################################################################################################################

#################
#Scan function###
#################

Scan()
{
     for ip in "${iplist[@]}"
do
    sudo bash $directory/nmapAutomator.sh $ip Quick

done
}  

### Variables for loop control

ips=0
counter=0
directory="${HOME}/Desktop/scriptssploits/nmapAutomator"

##number of ips to be scanned 

echo "how many ips are we scanning?"
read ips

## while look with the control loop 
while [ $counter -lt $ips ]
do
echo "what are the ips?" 
read line
iplist=("${iplist[@]}" $line)
counter=$[$counter+1]
done

##test section for variables and arrays 
#echo ${iplist[@]}
#echo ${iplist[0]}
#echo ${iplist[1]}

echo "current directory for nmapAutomator is $directory is this correct? y/n"
read line 

if [[ $line == "y" ]]
then
    echo "starting nmap scan from $directory"
      Scan	
          else 
	       echo "what is the installation directory?"
		   read this
                       directory=$this
                         Scan
fi

####################################################################
#                                                                 ##
#                   Created by 7h3_gh05t                          ## 
#                                                                 ##
####################################################################
