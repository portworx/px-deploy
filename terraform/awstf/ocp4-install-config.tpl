apiVersion: v1
baseDomain: ${tpl_ocp4domain}
compute:
- hyperthreading: Enabled
  name: worker
  platform:
    aws:
      type: $aws_type
  replicas: $nodes
controlPlane:
  hyperthreading: Enabled
  name: master
  platform: {}
  replicas: 3
metadata:
  creationTimestamp: null
  name: px-deploy-${tpl_configname}-${tpl_cluster}
networking:
  clusterNetwork:
  - cidr: 10.128.0.0/14
    hostPrefix: 23
  machineCIDR: 10.0.0.0/16
  networkType: OpenShiftSDN
  serviceNetwork:
  - 172.30.0.0/16
platform:
  aws:
    region: ${tpl_aws_region}
pullSecret: '${tpl_ocp4pullsecret}'
sshKey: '${tpl_sshkey}'
