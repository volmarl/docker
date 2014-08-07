# This is a comment
FROM centos:latest
MAINTAINER Lucien Volmar <lucien@aerospike.com>
RUN yum update -y 
RUN yum install yum-utils -y
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y install dkms binutils gcc make patch libgomp glibc-headers glibc-devel cpp kernel-devel kernel-headers perl openssh-clients man git vim wget curl ntp
RUN chkconfig ntpd on
RUN service ntpd stop
RUN ntpdate time.nist.gov
RUN service ntpd start
RUN chkconfig iptables off
RUN sed -i -e 's/^UUID=.*//' /etc/sysconfig/network-scripts/ifcfg-eth0
RUN sed -i -e 's/^HWADDR=.*//' /etc/sysconfig/network-scripts/ifcfg-eth0
RUN rm -f /etc/udev/rules.d/70-persistent-net.rules
#CMD ifconfig eth0 multicast
RUN yum -y install python-pip
RUN yum -y install python-devel
RUN mkdir /tmp/aero
RUN yum -y install wget
RUN cd /tmp/aero;wget 'http://iss0/release/server/3.3.12/centos6/aerospike-server-enterprise-3.3.12-el6.tgz';tar xzf aerospike-server-enterprise-3.3.12-el6.tgz
RUN yum install logrotate -y
RUN rpm -ivh /tmp/aero/aerospike-server-enterprise-3.3.12-el6/aerospike-*
RUN chkconfig --add aerospike
RUN yum -y install git vi
RUN cd /opt/;git clone git://github.com/ansible/ansible.git;cd ./ansible;source ./hacking/env-setup
RUN pip install paramiko PyYAML jinja2 httplib2
RUN yum install gcc
RUN cd /tmp/;wget 'http://iss0/release/amc/3.4.5/enterprise/aerospike-amc-enterprise-3.4.5-el5.x86_64.rpm'
RUN rpm -ivf /tmp/aerospike-amc-enterprise-3.4.5-el5.x86_64.rpm
VOLUME /opt/aerospike/data
EXPOSE 3000 3001 3002 3003 3004 8081 9918
ADD aerospike.conf /etc/aerospike/aerospike.conf
ADD loadshm.sh /bin/loadshm.sh 
RUN cd /bin/;chmod 755 loadshm.sh
