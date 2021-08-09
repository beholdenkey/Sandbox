#/bin/bash
#------------------------------------------------------------ #
# By @beholdenkey
# Compatible Operating systems: Centos 8 Stream, RHEL 8, Fedora 34
# Script to install Nautobot - CentOS and RHEL
# This process is being used to Create a Virtual Machine to then export as an OVA for Production Deployments.
#------------------------------------------------------------- #
# Resources - 16 vCores 32 GiB RAM 250 GiB Storage
# Leave the Host Name as the default (localhost.localdomain) this can be changed as needed later.
# It is important to remember that you need to remove all Network Configurations prior to exporting as an OVA
# The DISA STIG for Red Hat Enterprise LInux - Will be applied so be sure to correctly partition the storage
# Set Root Password
# Set User - standard - P@ssw0rd12