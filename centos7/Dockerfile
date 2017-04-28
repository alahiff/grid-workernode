FROM centos:7

RUN yum -y install yum-priorities

# EPEL
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Basic dependencies
RUN yum -y install freetype expat gcc glibc-headers compat-expat1 compat-openldap time man unzip quota attr

# Install HEP_OSlibs
RUN yum -y install http://linuxsoft.cern.ch/wlcg/centos7/x86_64/HEP_OSlibs-7.1.7-0.el7.cern.x86_64.rpm

# Machine job features
RUN yum -y install wget
RUN wget --no-check-certificate https://repo.gridpp.ac.uk/machinejobfeatures/mjf-scripts/00/RPMS/mjf-htcondor-00.14-1.noarch.rpm && \
    yum -y localinstall mjf-htcondor-00.14-1.noarch.rpm && \
    rm -f mjf-htcondor-00.14-1.noarch.rpm

# CVMFS (for SUM tests only)
RUN yum -y install https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm && \
    yum -y install https://ecsft.cern.ch/dist/cvmfs/cvmfs-config/cvmfs-config-default-latest.noarch.rpm && \
    yum -y install cvmfs

# Singularity
RUN yum -y install http://linuxsoft.cern.ch/wlcg/centos7/x86_64/singularity-2.2.1-1.osgup.el7.x86_64.rpm

# Update & cleanup
RUN yum -y update && \
    yum clean all
