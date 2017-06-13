#### execute playbooks
```
ansible-playbook prerequisites.yml --private-key=field.pem -f 5 --sudo
ansible-playbook ambari-agent.yml --private-key=field.pem -f 5 --sudo
```

#### requires /etc/ansible/hosts to include ambari-server at the minimum
```
[hdp]
aervits-hdp[0:7].field.hortonworks.com

[ambari-server]
aervits-hdp0.field.hortonworks.com
```

#### TODO
1. add REST call to add user-post-creation-hook
2. add REST call to add user to ambari
3. replace hard-coded ambari-server name with variable substitution
4. replace hard-coded repo url with variable
