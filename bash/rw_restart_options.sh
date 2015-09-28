#!/bin/bash
# Created by Joel Burgess-Allen 26-Jan-2015


# get arguments
while getopts 'e:l:h' OPT; do
  case $OPT in
    e)  env=$OPTARG;;
    l)  loc=$OPTARG;;
    h)  hlp="yes";;
  esac
done

# usage
HELP="
  usage: $0 [ -e value -l value ]

    -e --> environment: dev, uat, prod
    -l --> location: gb or us
    -h --> help
"

# help
if [ "$hlp" = "yes" ]; then
  echo "$HELP"
  exit 0
fi

# test input vars
if [ -z "$env" -o -z "$loc"  ]; then
  echo "$HELP"
  exit 1
fi

val="${env}-${loc}" 

if [ $val = "dev-gb" ] ; then 
  array=(GBGSWSCM005PRD GBGSWSCM008PRD GBGSWSCS007PRD)
elif [ $val = "dev-us" ] ; then
  array=(USSOJSTRA032PRD USSOJSTRA033PRD USSOJSTRA034PRD)
elif [ $val = "uat-gb" ] ; then
  array=(GBGSWSCM001PRD GBGSWSCM003PRD GBGSWSCM007PRD)
elif [ $val = "uat-us" ] ; then
  array=(USSOJSTRA025PRD USSOJSTRA027PRD USSOJSTRA041PRD)
elif [ $val = "prod-gb" ] ; then
  array=(GBSLOSCM006PRD GBSLOSCM010PRD GBSLOSCM011PRD)
elif [ $val = "prod-us" ] ; then
  array=(USSOJSTRA018PRD USSOJSTRA023PRD USSOJSTRA046PRD)
else
  echo "$HELP"
  exit 0
fi

ssh -qt ${array[0]} 'sudo supervisorctl stop stratus.task.scheduling_rottweiler.ui.web'
ssh -qt ${array[1]} 'sudo supervisorctl stop stratus.task.scheduling_rottweiler.mesos.scheduler'
ssh -qt ${array[2]} 'sudo supervisorctl stop mesos-slave'
ssh -qt ${array[1]} 'sudo supervisorctl stop mesos-master'
ssh -qt ${array[1]} 'sudo supervisorctl start mesos-master'
ssh -qt ${array[2]} 'sudo supervisorctl start mesos-slave'
ssh -qt ${array[1]} 'sudo supervisorctl start stratus.task.scheduling_rottweiler.mesos.scheduler'
ssh -qt ${array[0]} 'sudo supervisorctl start stratus.task.scheduling_rottweiler.ui.web'
