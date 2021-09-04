## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![elk diagram](Diagrams/elk_diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the yml configuration file may be used to install only certain pieces of it, such as Filebeat.

  - filebeat-playbook.yml
  - metricbeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly redundant, in addition to restricting access to the network.
- The load balancer helps mitigate DoS attacks by having multiple servers runnig the same websites
- The load balancer distributes traffic evenly among the servers running the same website when they're added to its backend pool.
- The jumpbox allows connection from a specific machince over the internet and it is the only way to access, configured and manage the webservers and the elk server. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the CPU usage, memory, files system, disk IO, network IO and system logs.

- Filebeat collects systems log files and forwards it to a Elasticsearch and Logstach.
- Metribeat collects CPU usage, memory usage, changes in file systems, disk IO and network IO.

The configuration details of each machine may be found below.

| Name                | Function          | IP Address | Operating System |
|---------------------|-------------------|------------|------------------|
| JumpBox-Provisioner | Gateway           | 10.0.0.4   | Linux            |
| web-1               | webserver         | 10.0.1.4   | Linux            |
| web-2               | webserver         | 10.0.1.5   | Linux            |
| web-3               | webserver         | 10.0.1.6   | Linux            |
| ELK-VM              | Monitoring Server | 10.1.1.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 99.102.208.218

Machines within the network can only be accessed by JumpBox-Provisioner.
- 10.1.1.4, 10.0.1.4, 10.0.1.5 and 10.0.1.6 are the machines within the network that can be accessed by JumpBox-Provisioner

A summary of the access policies in place can be found in the table below.

| Name                | Publicly Accessible | Allowed IP Address  |
|---------------------|---------------------|---------------------|
| JumpBox Provisioner | Yes                 | 99.102.208.218      |
| web-1               | No                  | 10.0.0.4            |
| web-2               | No                  | 10.0.0.4            |
| web-3               | No                  | 10.0.0.4            |
| ELK-VM              | No                  | 10.0.0.4            |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it saves time and reduces the need for human interaction with each VMs which could cause misconfiguration

The playbook implements the following tasks:
- Used the ansible sysctl module to allow VM to user more memory
- Installed docker.io on the ELK servers to for linux cointainers.
- Installed python module/libary for docker
- Installed sebp/elk:761 container on the elk-vm, enabled ports 5601:5601, 3200:9200, 5044:5044, and start restart policy to always
- Enabled docker service 

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker output](Diagrams/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.1.4
- 10.0.1.5
- 10.0.1.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeats collects system logs such as authentication, authorization from the machince is it configured to monitor.
- Metribeats collects uptime, memory usage, CPU usage from the machince or container is configured to monitor.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-config.yml file to webserver.
- Update the filebeat-playbook file to include docker machine
- Run the playbook, and navigate to elastic search to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._