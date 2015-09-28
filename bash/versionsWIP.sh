#!/bin/bash

function get_release_version {
  param=$(echo $1 | sed -e 's/\//\&a=/')
  echo $(curl -s "http://nexus.thisisnoble.com/service/local/lucene/search?g=$param" 2>/dev/null | grep -m 1 '<latestRelease>' | sed 's/\( *<[^>]*>\)//g')
}

function get_snapshot_version {
  param=$(echo $1 | sed -e 's/\//\&a=/')
  echo $(curl -s "http://nexus.thisisnoble.com/service/local/lucene/search?g=$param" 2>/dev/null | grep -m 1 '<latestSnapshot>' | sed 's/\( *<[^>]*>\)//g')
}

pegged_dev_snap=('snowflake.rottweiler/rottweiler.ui.web@3.1.5-20150205.094707-1'
'snowflake.rottweiler/rottweiler.mesos.scheduler@3.1.5-20150205.094635-1'
'snowflake.rottweiler/rottweiler.mesos.executor@3.1.5-20150205.094643-1'
'igloo.blackmamba/blackmamba.server@3.0.6-20150204.115403-5')

pegged_dev=('snowflake.akita/akita.server@6.0.0')

pegged_uat=('snowflake.akita/akita.server@6.0.0'
'snowball/samasa@0.3.27'
'igloo.blackmamba/blackmamba.server@3.0.5'
'snowball/nexus-app@0.4.20'
'nexus/nexus.service@0.4.3'
'snowball/shepherd-app@2.0.12'
'snowball/shepherd-app@2.0.23'
'snowball.shepherd/shepherd.server@2.0.2'
'snowflake.rottweiler/rottweiler.ui.web@3.1.4'
'snowflake.rottweiler/rottweiler.mesos.scheduler@3.1.4'
'snowflake.rottweiler/rottweiler.mesos.executor@3.1.4'
'snowball.samasaplugin/samasa.server@1.3.12'
'snowball/vault-app@1.0.18'
'oildev.vault/vault.server@1.0.17')

pegged_prod=('snowball.samasaplugin/samasa.server@1.3.10'
'igloo.flyingsquirrel/flyingsquirrel.ndovu@1.0.0'
'igloo.flyingsquirrel/flyingsquirrel.mamba@1.0.0'
'igloo.griffin/griffin.helios@4.0.2'
'igloo.griffin/griffin.server@4.0.2'
'igloo.snowyowl/snowyowl.core@1.0.0'
'igloo.ndovu/ndovu.server@3.2.8'
'snowball.shepherd/shepherd.server@2.0.2'
# 'snakecharmer/snakecharmer.metalsblotter@1.0.0'
# 'snakecharmer/snakecharmer.optionsexpiry@1.0.0'
'snowflake.rottweiler/rottweiler.ui.web@3.1.0'
'oildev.mousetrap/mousetrap.web.admin@1.0.4'
'oildev.cyanea/cyanea@1.0.17'
'oildev.bananapeel/bananapeel@1.0.47'
'oildev.vault/vault.server@1.0.17'
'snowball.capuchin/capuchin.app@2.0.9'
'snowball.graphtool/graphtool@2.0.4'
'snowball.dumbooctopus/dumbooctopus.server@3.1.3'
'snowflake.akita/akita.server@6.0.0'
'snowflake.rottweiler/rottweiler.mesos.scheduler@3.1.0'
'igloo.blackmamba/blackmamba.server@3.0.3'
'igloo.octopus/octopus.server@5.1.2'
'snowflake.rottweiler/rottweiler.mesos.executor@3.1.0'
'nexus/nexus.service@0.3.2'
'png.bulldozer/bulldozer.service@1.0.1'
'snowball/iris-app@0.4.2'
'snowball/graphtool-app@0.0.2'
'snowball/launchpad-app@0.3.5'
'snowball/calendar-app@0.0.10'
'snowball/samasa@0.3.26'
'snowball/snowball@0.2.7'
'snowball/ssg-app@0.0.4'
'snowball/metals-trade-app@0.4.3'
'snowball/shepherd-app@2.0.23'
'snowball/nexus-app@0.3.17'
'snowball/vault-app@1.0.18'
'snowball/warbler-app@0.0.7'
'snowball/whisper-app@0.0.3'
# 'krait/krait.server@1.0.0'
'stratus.security/who@1.0.0'
# 'stratus.corporate.narwhal/narwhal.service@1.0.0'
'snowball/bulldozer-app@1.1.2')

components=('snowball.samasaplugin/samasa.server'
'igloo.flyingsquirrel/flyingsquirrel.ndovu'
'igloo.flyingsquirrel/flyingsquirrel.mamba'
'igloo.griffin/griffin.helios'
'igloo.griffin/griffin.server'
'igloo.snowyowl/snowyowl.core'
'igloo.ndovu/ndovu.server'
'snowball.shepherd/shepherd.server'
'snakecharmer/snakecharmer.metalsblotter'
'snakecharmer/snakecharmer.optionsexpiry'
'snowflake.rottweiler/rottweiler.ui.web'
'oildev.mousetrap/mousetrap.web.admin'
'oildev.cyanea/cyanea'
'oildev.bananapeel/bananapeel'
'oildev.vault/vault.server'
'snowball.capuchin/capuchin.app'
'snowball.graphtool/graphtool'
'snowball.dumbooctopus/dumbooctopus.server'
'snowflake.akita/akita.server'
'snowflake.rottweiler/rottweiler.mesos.scheduler'
'igloo.blackmamba/blackmamba.server'
'igloo.octopus/octopus.server'
'snowflake.rottweiler/rottweiler.mesos.executor'
'nexus/nexus.service'
'png.bulldozer/bulldozer.service'
'snowball/iris-app'
'snowball/graphtool-app'
'snowball/launchpad-app'
'snowball/calendar-app'
'snowball/samasa'
'snowball/snowball'
'snowball/ssg-app'
'snowball/metals-trade-app'
'snowball/shepherd-app'
'snowball/nexus-app'
'snowball/vault-app'
'snowball/warbler-app'
'snowball/whisper-app'
'krait/krait.server'
'stratus.security/who'
'stratus.corporate.narwhal/narwhal.service'
'snowball/bulldozer-app')

for component in ${components[@]} ; do
  # Get Latest Versions
  snapshot_version=$(get_snapshot_version $component)
  release_version=$(get_release_version $component)
  id=$(echo $component | sed -e 's/[^/]*\///')
  # Amedn versions for pegging
  # DEV
  if [[ ${pegged_dev_snap[*]} =~ "$component" ]] ; then
    for i in ${pegged_dev_snap[@]} ; do
      trim=$(echo $i | grep -oE "^[^@]*")
      if [[ $component == $trim ]] ; then
        snapshot_version=$(echo $i | grep -oE "[^@]*$")
        printf -- "  $id: { repository: snapshots, version: $snapshot_version }\n" >> 1dev_joel.yaml
        break
      fi 
    done
  elif [[ ${pegged_dev[*]} =~ "$component" ]] ; then
    for i in ${pegged_dev[@]} ; do
      trim=$(echo $i | grep -oE "^[^@]*")
      if [[ $component == $trim ]] ; then
        release_version=$(echo $i | grep -oE "[^@]*$")
        printf -- "  $id: { repository: releases, version: $release_version }\n" >> 1dev_joel.yaml
        break
      fi 
    done
  else
    if [[ $snapshot_version == "" ]] ; then
      printf -- "  $id: { repository: releases, version: $release_version }\n" >> 1dev_joel.yaml
    else
      printf -- "  $id: { repository: snapshots, version: $snapshot_version }\n" >> 1dev_joel.yaml
    fi
  fi
  # UAT
  if [[ ${pegged_uat[*]} =~ "$component" ]] ; then
    for i in ${pegged_uat[@]} ; do
      trim=$(echo $i | grep -oE "^[^@]*")
      if [[ $component == $trim ]] ; then
        release_version=$(echo $i | grep -oE "[^@]*$")
        printf -- "  $id: { repository: releases, version: $release_version }\n" >> 1uat_joel.yaml
        break
      fi 
    done
  else
    if [[ $release_version == "" ]] ; then
      printf -- "  $id: { repository: snapshots, version: $snapshot_version }\n" >> 1uat_joel.yaml
    else
      printf -- "  $id: { repository: releases, version: $release_version }\n" >> 1uat_joel.yaml
    fi
  fi
  # PROD
  if [[ ${pegged_prod[*]} =~ "$component" ]] ; then
    for i in ${pegged_prod[@]} ; do
      trim=$(echo $i | grep -oE "^[^@]*")
      if [[ $component == $trim ]] ; then
        release_version=$(echo $i | grep -oE "[^@]*$")
        printf -- "  $id: { repository: releases, version: $release_version }\n" >> 1prod_joel.yaml
        break
      fi 
    done
  else
    if [[ $release_version == "" ]] ; then
      printf -- "  $id: { repository: snapshots, version: $snapshot_version }\n" >> 1prod_joel.yaml
    else
      printf -- "  $id: { repository: releases, version: $release_version }\n" >> 1prod_joel.yaml
    fi
  fi
done
