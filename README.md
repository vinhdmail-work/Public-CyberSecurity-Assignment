# Public-CyberSecurity-Assignment
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

\Cybersecurity-Assignment\Diagrams\Network with ELK.drawio

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

To create Webservers
\Cybersecurity-Assignment\Ansible\Roles\webservers.yml

To create ELK server
\Cybersecurity-Assignment\Ansible\Roles\ELK.yml

To add filebeat to webservers
\Cybersecurity-Assignment\Ansible\Roles\filebeat-playbook.yml

Configuration file for filebeat. This needs to be configured in filebeat-playbook.yml to use this config file.
\Cybersecurity-Assignment\Ansible\ConfigFiles\filebeat-config.yml

To add metric beat to webserver
\Cybersecurity-Assignment\Ansible\Roles\metricbeat-playbook.yml

Configuration file for metricbeat. This needs to be configured in metricbeat-playbook.yml to use this config file.
\Cybersecurity-Assignment\Ansible\Roles\metricbeat-playbook.yml


This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.The load balancer will help to distribute load to each of the server, assist with redundnacy and increase availability. It may also provide security against DOS attacks. The jump box allows a secure connection to access the servers for maintenance and update.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system resources. Filebeat provide informatin on system logs. Mericbeat monitors the CPU, and memory usage, network speed..

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function 			| IP Address | Operating System |
|----------|----------------------------|------------|------------------|
| Jump Box | Gateway  			| 10.0.0.4   | Linux            |
| VM1      | WebServer			| 10.0.0.5   | Linux            |
| VM2      | Webserver			| 10.0.0.6   | Linux            |
| ELK      | Logging and analysising 	| 10.4.0.1   | Linux                 |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 61.69.226.70 (remote access IP address)

Machines within the network can only be accessed by Jump Box.
- Jump Box (10.0.0.4) via ansible container is allowed access to the ELK VM (10.4.0.1), VM1 (10.0.0.5), VM2 (10.0.0.6)

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes (SSH)           | 61.69.226.70         |
|          | No                  | 10.0.0.5             |
|          | No                  | 10.0.0.6             |
| ELK      | Yes (Port 5601)     | 61.69.226.70         |
|          | No                  | 10.0.0.6             |
|          | No                  | 10.0.0.5             |
|          | No                  | 10.0.0.6             |
| VM1	   | No			 | 10.0.0.5		|
|	   | Yes, port 80 via load balancer with public IP 20.211.121.2 
| VM2	   | No                  | 10.0.0.6             |
| 	   | Yes, port 80 via load balancer with public IP 20.211.121.2

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it allows rapid deployment.

The playbook implements the following tasks:
-setup Jump box server
-within Jumpbox server, install docker
-then install ansible
-update ansible hosts file (/etc/ansible/hosts) to contain details of the ELK VM
-update ansible.cfg file to contain login details
-within ansible container in the jump box create a ansible playbook yml file
-run the playbook

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
\Cybersecurity-Assignment\docker ps.jpg

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- VM1 IP 10.0.0.5
- VM2 IP 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat provide system logs such as login details, users, commands used
- Metricbeat provides information about the system eg CPU usuage, memory usage.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ELK.yml file to ansible container /etc/ansible.
- Update the host file in ansible container to include ELK server under its own heading
- Run the playbook, and navigate to ELK server public IP address on port 5601 i.e. http://40.115.90.85:5601/app/kibana# to check that the installation worked as expected.

-To the run the ELK.yml use the followng command ansible-playbook ELK.yml It will down and install the files specified in the ELK.yml file

