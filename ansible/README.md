#### install sshpass to use --ask-pass option
`sudo apt-get install sshpass`

#### ping nodes
`ansible all -m ping --ask-pass`

#### install package using apt
`ansible all -m apt -a "name=ansible state=latest" -u vagrant --sudo --ask-pass`

#### add user admin
`ansible all -m user -a "name=admin" -u vagrant --sudo --ask-pass`

#### use shell command
`ansible all -m shell -a "ps aux | grep java" -u vagrant --sudo --ask-pass`

#### reboot a server
`ansible servername -a "/sbin/reboot" -f 10 -u vagrant --sudo --ask-pass`
