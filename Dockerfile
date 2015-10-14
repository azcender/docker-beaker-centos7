FROM centos:6

MAINTAINER Bryan Belanger bbelanger@azcender.com

RUN yum clean all
RUN yum install -y sudo openssh-server openssh-clients curl ntpdate git
RUN yum -y upgrade
#RUN yum -y localinstall http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm;
#RUN yum -y install puppet-agent
#RUN mkdir -p /etc/facter/facts.d/

RUN rpm --replacepkgs -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
RUN yum -y install puppet
RUN rpm -q curl


#RUN apt-get -y update; \
#    curl -O http://apt.puppetlabs.com/puppetlabs-release-pc1-jessie.deb; \
#    dpkg -i puppetlabs-release-pc1-jessie.deb; \
#    apt-get -y install puppet

#WORKDIR /etc/puppetlabs/code

ENV PATH /opt/puppetlabs/bin:$PATH

#COPY tomcat.txt /etc/facter/facts.d/

COPY hiera.yaml /etc/

COPY environments/hieradata /etc/puppetlabs/code/environments/production/hieradata

COPY environments/modules /etc/puppet/modules

#WORKDIR /tmp

#COPY environment/manifests/site.pp /tmp/

#RUN puppet apply site.pp

# RUN rm -rf /etc/puppetlabs/code

# CMD ["/opt/tomcat/bin/catalina.sh", "run"]

# EXPOSE 8080
