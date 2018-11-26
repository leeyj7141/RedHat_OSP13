#!/bin/bash
openstack overcloud deploy --templates \
-e /home/stack/templates/node-info.yaml \
-e /home/stack/templates/overcloud_images.yaml \
-e /home/stack/templates/scheduler_hints_env.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
-e /home/stack/templates/network-environment.yaml \
-e /home/stack/templates/environments/ips-from-pool-all.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-lbaasv2.yaml \
-e /home/stack/templates/environments/storage/external-ceph.yaml \
-e /home/stack/templates/low-memory-usage.yaml \
--ntp-server pool.ntp.org \
--libvirt-type  kvm \
--log-file=log/overcloud_deploy-`date +%Y%m%d-%H:%M`.log

