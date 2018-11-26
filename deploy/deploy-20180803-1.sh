#!/bin/bash 

#  with ip pool, with scheduler hints , no mgmt network
# create fail why? 

echo ---- openstack stack delete start -------------
openstack stack delete yj23-osp13-12 --yes --wait
echo ---- openstack stack delete end -------------
sleep 10 

echo ---- openstack stack delete start -------------
openstack stack delete yj23-osp13-12 --yes --wait
echo ---- openstack stack delete end -------------
sleep 10 

echo ---- openstack stack delete start -------------
openstack stack delete yj23-osp13-12 --yes --wait
echo ---- openstack stack delete end -------------
sleep 10 

echo ---- stack start ----
openstack overcloud deploy --templates \
--stack yj23-osp13-13 \
-e /home/stack/templates/overcloud_images_local_barbican.yaml \
-e /home/stack/templates/node-info.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
-e /home/stack/templates/network-environment.yaml \
-e /home/stack/templates/scheduler-hints.yaml \
-e /home/stack/templates/ips-from-pool-all.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/services-docker/neutron-ovn-dvr-ha.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/services/sahara.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/manila-cephfsnative-config-docker.yaml \
-e /home/stack/templates/external-ceph.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/services/barbican.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/barbican-backend-simple-crypto.yaml \
-e /home/stack/templates/barbican-configure.yml \
-e /usr/share/openstack-tripleo-heat-templates/environments/low-memory-usage.yaml \
--libvirt-type kvm \
--timeout 120  \
--ntp-server 192.1.1.1 \
--log-file=log/overcloud_deploy-`date +%Y%m%d-%H:%M`.log

#--overcloud-ssh-user admin \
#-e /home/stack/templates/scheduler_hints_env.yaml \
#-e /home/stack/templates/octavia-environments.yaml \
#-e /usr/share/openstack-tripleo-heat-templates/environments/services-docker/octavia.yaml \
#-e /usr/share/openstack-tripleo-heat-templates/environments/services/octavia.yaml \
#-e /home/stack/templates/network-environment.yaml \
