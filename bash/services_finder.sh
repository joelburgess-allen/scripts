#!/bin/bash
# Created by Joel Burgess-Allen 02-Feb-2015


dev_gbgsw=$(awk 'NR>1 {if ($0 == "") exit; else print $1}' ~/gitlab/honeybadger/provisioning/inventories/dev-gbgsw.ini)
dev_ussoj=$(awk 'NR>1 {if ($0 == "") exit; else print $1}' ~/gitlab/honeybadger/provisioning/inventories/dev.ini)
uat_gbgsw=$(awk 'NR>1 {if ($0 == "") exit; else print $1}' ~/gitlab/honeybadger/provisioning/inventories/uat-gbgsw.ini)
uat_ussoj=$(awk 'NR>1 {if ($0 == "") exit; else print $1}' ~/gitlab/honeybadger/provisioning/inventories/uat.ini)
prod_gbslo=$(awk 'NR>1 {if ($0 == "") exit; else print $1}' ~/gitlab/honeybadger/provisioning/inventories/gbslo.ini)
prod_ussoj=$(awk 'NR>1 {if ($0 == "") exit; else print $1}' ~/gitlab/honeybadger/provisioning/inventories/noam.ini)

global_host=$dev_gbgsw" "$dev_ussoj" "$uat_gbgsw" "$uat_ussoj" "$prod_gbslo" "$prod_ussoj

echo "**** Be PATIENT, this takes a minute! ****"

for i in $global_host ; do
  ssh -qt $i "sudo supervisorctl status | awk -v var=\$(hostname -s) '{print var, \$1}'" ;
done

