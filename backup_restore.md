# Backup Restoration Instruction
##### v1
9 Nov 2023

## Before strart
Open Terminal
### Clone the repo to the desired location
```
cd path/to/where/you/want/to/create/ansible-playbook
```
#### with ssh:
```
git clone git@github.com:Jesya-o/ica0002.git
```
#### with https:
```
https://github.com/Jesya-o/ica0002.git
```

### Install ansible if needed
#### Install
```
python3 -m venv ~/ansible-venv && ~/ansible-venv/bin/pip install ansible==6.7.0
```
#### Check
```
~/ansible-venv/bin/ansible --version
```
You should see this in the output: ansible [core 2.13.11]
#### Command shortening
```
sudo vim ~/.profile
```
Go to the end of file, press 'i', write this in the end of file
```
PATH="$HOME/ansible-venv/bin:$PATH"
```
Press 'Esc', then enter ':wq'
Enter the command
```
source ~/.profile
```
#### Make sure to have the password of the vault in the ~/.ansible/vault_password
```
cat ~/.ansible/vault_password
```
If there is no such file, or it contains wrong password:
```
vim ~/.ansible/vault_password
```
Just paste password there and press ':wq'

#### Update host ports
```
./update.sh
```
#### Run the playbook
If it will ask questions, then enter yes continuously. If it freezes, then also enter yes
```
ansible-playbook infra.yaml
```
#### ssh to the second host
```
ssh -p<second line, port from the hosts file> ubuntu@193.40.156.67
```
#### Become a **root** user:
```
sudo -i
```

## MySQL database restoration
```
sudo -u backup duplicity --no-encryption restore rsync://Jesya-o@backup.epy.io//home/Jesya-o/mysql /home/backup/restore/mysql && mysql agama < /home/backup/restore/mysql/agama.sql
```

## InfluxDB restoration
```
sudo -u backup duplicity --no-encryption restore rsync://Jesya-o@backup.epy.io//home/Jesya-o/influxdb /home/backup/restore/influxdb && service telegraf stop && influx -execute 'DROP DATABASE telegraf' && influxd restore -portable -database telegraf /home/ахbackup/restore/influxdb && service telegraf start
```