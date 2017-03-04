#### execute playbooks
```
ansible-playbook prerequisite.yml --private-key=field.pem -f 5 --sudo
ansible-playbook ambari-agent.yml --private-key=field.pem -f 5 --sudo
```

#### TODO
1. add REST call to add user-post-creation-hook
2. add REST call to add user to ambari
