FROM centos:6

RUN yum -y install yum-priorities

# EPEL
RUN yum -y install https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# UMD
RUN yum -y install http://repository.egi.eu/sw/production/umd/3/sl6/x86_64/updates/umd-release-3.14.4-1.el6.noarch.rpm

# Basic dependencies
RUN yum -y install freetype expat gcc glibc-headers compat-expat1 compat-openldap time man unzip quota attr

# Install HEP_OSlibs
RUN yum -y install http://linuxsoft.cern.ch/cern/slc64/x86_64/yum/extras/HEP_OSlibs_SL6-1.0.16-0.el6.x86_64.rpm

# Install glexec, lcmaps & lcas
RUN yum -y install glexec mkgltempdir \
                   lcmaps lcmaps-plugins-verify-proxy lcmaps-plugins-basic lcmaps-plugins-voms lcmaps-plugins-c-pep \
                   lcas lcas-plugins-basic lcas-plugins-voms

# Machine job features
RUN yum -y install wget
RUN wget --no-check-certificate https://repo.gridpp.ac.uk/machinejobfeatures/mjf-scripts/00/RPMS/mjf-htcondor-00.14-1.noarch.rpm && \
    yum -y localinstall mjf-htcondor-00.14-1.noarch.rpm && \
    rm -f mjf-htcondor-00.14-1.noarch.rpm

# CVMFS (for SUM tests only)
RUN yum -y install https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm && \
    yum -y install https://ecsft.cern.ch/dist/cvmfs/cvmfs-config/cvmfs-config-default-latest.noarch.rpm && \
    yum -y install cvmfs

# Update & cleanup
RUN yum -y update && \
    yum clean all

# glexec
RUN mkdir -p /opt/glite/sbin && ln -s /usr/sbin/glexec /opt/glite/sbin/glexec
RUN mkdir -p /var/log/glexec && chown root:glexec /var/log/glexec

# Required for jobs created by glite-WMS submitted to an ARC CE
RUN touch /usr/etc/globus-user-env.sh

