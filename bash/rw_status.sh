#!/bin/bash
# Created by Joel Burgess-Allen 26-Jan-2015

if [ $1 = "dev-gb" ] ; then 
  array=(GBGSWSCM005PRD GBGSWSCM008PRD GBGSWSCS007PRD)
elif [ $1 = "dev-us" ] ; then
  array=(USSOJSTRA032PRD USSOJSTRA033PRD USSOJSTRA034PRD)
elif [ $1 = "uat-gb" ] ; then
  array=(GBGSWSCM001PRD GBGSWSCM003PRD GBGSWSCM007PRD)
elif [ $1 = "uat-us" ] ; then
  array=(USSOJSTRA025PRD USSOJSTRA027PRD USSOJSTRA041PRD)
elif [ $1 = "prod-gb" ] ; then
  array=(GBSLOSCM006PRD GBSLOSCM010PRD GBSLOSCM011PRD)
elif [ $1 = "prod-us" ] ; then
  array=(USSOJSTRA018PRD USSOJSTRA023PRD USSOJSTRA046PRD)
else
  echo "please specify environment-location i.e. (dev-gb|dev-us|uat-gb|uat-us|prod-gb|prod-us)"
  exit 0
fi

echo ${array[0]}
ssh -qt ${array[0]} 'sudo supervisorctl status | grep stratus.task.scheduling_rottweiler.ui.web'
echo ${array[1]}
ssh -qt ${array[1]} 'sudo supervisorctl status | grep stratus.task.scheduling_rottweiler.mesos.scheduler'
echo ${array[2]}
ssh -qt ${array[2]} 'sudo supervisorctl status | grep mesos-slave'
echo ${array[1]}
ssh -qt ${array[1]} 'sudo supervisorctl status | grep  mesos-master'
