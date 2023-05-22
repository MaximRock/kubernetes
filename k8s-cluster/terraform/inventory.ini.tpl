#${hostname_master_1} ansible_host=admin@${external_ip_address_master_1}

# ## Configure 'ip' variable to bind kubernetes services on a
# ## different ip than the default iface
# ## We should set etcd_member_name for etcd cluster. The node that is not a etcd member do not need to set the value, or can set the empty string value.
[all]
${hostname_master_1} ansible_host=${external_ip_address_master_1}  ip=${internal_ip_address_master_1} etcd_member_name=etcd1
${hostname_master_2} ansible_host=${external_ip_address_master_2}  ip=${internal_ip_address_master_2} etcd_member_name=etcd1
${hostname_app_1} ansible_host=${external_ip_address_app_1}  ip=${internal_ip_address_app_1} etcd_member_name=etcd1
${hostname_app_2} ansible_host=${external_ip_address_app_2}  ip=${internal_ip_address_app_2}

# ## configure a bastion host if your nodes are not directly reachable
# [bastion]
# bastion ansible_host=x.x.x.x ansible_user=some_user

[kube_control_plane]
${hostname_master_1}
${hostname_master_2}

[etcd]
${hostname_master_1}
${hostname_master_2}
${hostname_app_1}

[kube_node]
${hostname_master_1}
${hostname_master_2}
${hostname_app_1}
${hostname_app_2}

[calico_rr]

[k8s_cluster:children]
kube_control_plane
kube_node
calico_rr