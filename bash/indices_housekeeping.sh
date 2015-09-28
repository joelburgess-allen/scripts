#!/bin/bash
# Created by Joel Burgess-Allen 29-Jan-2015

logfile=/tmp/indices_housekeeping.log
declare -x keep_num=40

blackmamba_hosts='USSOJSTRA008PRD USSOJSTRA013PRD GBGSWSSX006PRD USSOJSTRA006PRD USSOJSTRA007PRD USSOJSTRA015PRD GBGSWSSX001PRD GBGSWSSX002PRD USSOJSTRA004PRD USSOJSTRA005PRD GBSLOSSX009PRD GBSLOSSX010PRD GBSLOSSX008PRD GBSLOSSL007PRD GBSLOSSL008PRD'

monitoring_hosts='USSOJSTRA009PRD GBGSWSSX004PRD USSOJSTRA042PRD GBGSWSCM006PRD USSOJSTRA017PRD GBSLOSCM012PRD'

for i in $blackmamba_hosts ; do 
  date=$(date +%d-%b-%Y' '%H:%M)
  ssh -qt $i "ls -tla /data/applications/igloo.blackmamba/blackmamba.server/mamba.server/data/*/nodes/0/indices | grep marvel | awk 'NR>28 { print \"host: \"\"$i\"\" file: \"\$9\" was removed by indices_housekeeping.sh around \"\"$date\" }'" >> $logfile ; 
  ssh -qt $i "ls -tla /data/applications/igloo.blackmamba/blackmamba.server/mamba.server/data/*/nodes/0/indices | grep marvel | awk 'NR>28 { print \"http://\"\"$i\"\".ng.corp:7200/\"\$9 }' | xargs curl -XDELETE" > /dev/null ; 
done

for i in $monitoring_hosts ; do 
  date=$(date +%d-%b-%Y' '%H:%M)
  ssh -qt $i "ls -tla /data/elasticsearch/*/nodes/0/indices | grep logstash | awk 'NR>28 { print \"host: \"\"$i\"\" file: \"\$9\" was removed by indices_housekeeping.sh around \"\"$date\" }'" >> $logfile ; 
  ssh -qt $i "ls -tla /data/elasticsearch/*/nodes/0/indices | grep logstash | awk 'NR>28 { print \"http://\"\"$i\"\".ng.corp:9200/\"\$9 }' | xargs curl -XDELETE" > /dev/null ; 
done
