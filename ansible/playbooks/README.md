#### execute playbooks
```
ansible-playbook prerequisite.yml --private-key=field.pem -f 5 --sudo
ansible-playbook ambari-agent.yml --private-key=field.pem -f 5 --sudo
```
