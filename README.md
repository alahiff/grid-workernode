# Grid worker node images

Based on the traditional worker nodes used at RAL and are known to work for ALICE, ATLAS, CMS and LHCb, in addition to a number of other experiments. Note that:
- these are not necessarily the most minimal Grid worker node container images possible
- there is no configuration within the images. It is assumed that all configuration files will be mounted into any containers using these images (including glexec, lcas, lcmaps, machine job features, ARC runtime environments, ...)
- `/etc/grid-security/certificates` should be mounted in any containers using these images (e.g. ca-policy-egi-core and fetch-crl should be on the hosts)
- machine job features is included, but `/etc/machinefeatures` needs to be mounted into any containers using these images
- no grid middleware is installed, apart from glexec, lcas and lcmaps (CentOS6 only). It is assumed that all grid middleware will be obtained from CVMFS (`/cvmfs/grid.cern.ch`). However, some dependencies of grid middleware are included when necessary (e.g. Boost).
