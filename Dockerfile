FROM sath89/oracle-ee-11g
MAINTAINER Wilmer Acosta <wilmer.acosta@tia.com.ec>

#Change Password
RUN echo 'root:root' | chpasswd
RUN echo 'oracle:oracle' | chpasswd

RUN cd /etc/yum.repos.d && curl -O http://public-yum.oracle.com/public-yum-ol7.repo
RUN sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/public-yum-ol7.repo

# Install packages and set up sshd
RUN yum -y install openssh-server
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

#Install X11 Display
RUN yum install -y xorg-x11-server-Xorg xorg-x11-xauth

EXPOSE 22 1521 8080
CMD ["/usr/sbin/sshd", "-D"]