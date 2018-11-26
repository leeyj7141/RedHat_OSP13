#!/bin/bash 

# ------- ovn dvr config -------- #

#echo ---- stack delete ----
#openstack stack delete yj23-osp13 --yes --wait 
#sleep 1m 
#
#echo ---- stack delete ----
#openstack stack delete yj23-osp13 --yes --wait 
#sleep 1m 

echo ---- stack start ----
openstack overcloud deploy --templates \
--stack yj23-osp13 \
-e /home/stack/templates/overcloud_images_local_ovn.yaml \
-e /home/stack/templates/node-info.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
-e /home/stack/templates/network-environment.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/services-docker/neutron-ovn-dvr-ha.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/services-docker/octavia.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/services/sahara.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/low-memory-usage.yaml \
-e /home/stack/templates/external-ceph.yaml \
--libvirt-type kvm \
--timeout 100  \
--ntp-server 192.168.24.1 \
--log-file=log/overcloud_deploy-`date +%Y%m%d-%H:%M`.log

#--overcloud-ssh-user admin \
#-e /home/stack/templates/scheduler_hints_env.yaml \

