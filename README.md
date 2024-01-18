# Services Infrastructure Project on 3 VMs with Ansible
Infrastructure includes simple app available on highly available link and regular link. High availability is reached using multiple Docker containers running on first and second machine, HAProxy and Keepalived. Data of the app is saved to the MySQL which is backuped on remote server and has a replica on other machine, so in case of failure on first machine the app will keep working. 

Infrastructure services send logs to the Prometheus set up on the third machine using Prometheus Node Exporters. Services state and graphs, syslog and machines' health can be viewed through Grafana Dashboards. Grafana is also accessible on third machine public URL. Logs are saved to the InfluxDB.


#### [Backup Approach Documentation](https://github.com/Jesya-o/ica0002/blob/main/backup_sla.md)
#### [Backup Restoration Instruction](https://github.com/Jesya-o/ica0002/blob/main/backup_restore.md)

## Adjustments
VMs should be updated with IPs and ports in [hosts](https://github.com/Jesya-o/ica0002/blob/main/hosts) file.
* Initially IPs and ports were gained from a website, so there is a [update.sh](https://github.com/Jesya-o/ica0002/blob/main/update.sh) file for a simple update. 
* Any service can be moved to the different VMs changing hosts in [hosts](https://github.com/Jesya-o/ica0002/blob/main/hosts) file for exact service.
* There can be set any number of app containers per machine in [vars file](https://github.com/Jesya-o/ica0002/blob/main/group_vars/all.yaml).
* Passwords can be changed in the same [vars file](https://github.com/Jesya-o/ica0002/blob/main/group_vars/all.yaml).

After changes those are expected to be applied running from the package where the project is located.

``` 
ansible-playbook infra.yaml -t[choose appropriate tags from infra.yaml file, on first run this is left empty]
```

Examples:

* first run: ```ansible-playbook infra.yaml```
* changed number of containers: ```ansible-playbook infra.yaml -tapp```
