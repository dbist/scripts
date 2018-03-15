#### execute playbooks
### Required:
1. VirtualBox
2. Vagrant
3. Ansible

#### as the first step run
```
ssh-keygen
```
```
ansible-playbook ambari-prereqs.yml --private-key=field.pem -f 5 --sudo
ansible-playbook ambari-agent.yml --private-key=field.pem -f 5 --sudo
```

#### requires /etc/ansible/hosts to include ambari-server at the minimum
#### or see inventory file for example
```
[nodes]
aervits-hdp[0:7].field.hortonworks.com

[ambari-server]
aervits-hdp0.field.hortonworks.com
```

#### TODO
1. add REST call to add user-post-creation-hook
2. add REST call to add user to ambari

