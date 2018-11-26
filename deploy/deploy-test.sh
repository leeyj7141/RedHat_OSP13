#!/bin/bash 

openstack overcloud deploy --templates 
#--stack cloud-yj21 \
#--timeout 240  \
#--libvirt-type kvm \
#--ntp-server 192.168.24.1 \
#--overcloud-ssh-user admin \
#-e /home/stack/templates/node-info.yaml \
#-e /home/stack/templates/overcloud_images.yaml \
#-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
#-e /home/stack/templates/network-environment.yaml \
