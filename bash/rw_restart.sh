#!/bin/bash
# Created by Joel Burgess-Allen 26-Jan-2015

if [ $1 = "dev-gbgsw" ] ; then 
  array=(GBGSWSCM005PRD GBGSWSCM008PRD GBGSWSCS007PRD)
elif [ $1 = "dev-ussoj" ] ; then
  array=(USSOJSTRA032PRD USSOJSTRA033PRD USSOJSTRA034PRD)
elif [ $1 = "uat-gbgsw" ] ; then
  array=(GBGSWSCM001PRD GBGSWSCM003PRD GBGSWSCM007PRD)
elif [ $1 = "uat-ussoj" ] ; then
  array=(USSOJSTRA025PRD USSOJSTRA027PRD USSOJSTRA041PRD)
elif [ $1 = "prod-gbslo" ] ; then
  array=(GBSLOSCM006PRD GBSLOSCM010PRD GBSLOSCM011PRD)
elif [ $1 = "prod-ussoj" ] ; then
  array=(USSOJSTRA018PRD USSOJSTRA023PRD USSOJSTRA046PRD)
else
  echo "please specify environment-location i.e. (dev-gbgsw|dev-ussoj|uat-gbgsw|uat-ussoj|prod-gbslo|prod-ussoj)"
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
