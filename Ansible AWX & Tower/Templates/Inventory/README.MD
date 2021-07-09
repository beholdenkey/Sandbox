# How To Set Up Ansible Inventories

## Step 1 — Creating a Custom Inventory File

Upon installation, Ansible creates an inventory file that is typically located at /etc/ansible/hosts. This is the default location used by Ansible when a custom inventory file is not provided with the -i option, during a playbook or command execution.

Even though you can use this file without problems, using per-project inventory files is a good practice to avoid mixing servers when executing commands and playbooks. Having per-project inventory files will also facilitate sharing your provisioning setup with collaborators, given you include the inventory file within the project’s code repository.

To get started, access your home folder and create a new directory to hold your Ansible files:

``` bash
cd ansible
nano inventory
```

``` bash
203.0.113.111
203.0.113.112
203.0.113.113
server_hostname
```

``` bash
ansible-inventory -i inventory --list
```

## Running Commands and Playbooks with Custom Inventories

To run Ansible commands with a custom inventory file, use the -i option as follows:

``` bash
ansible all -i inventory -m ping
```
