#! /bin/bash

USER=$(/usr/bin/whoami)
echo "Configuring as: ${USER}"
echo

echo "============================================="
echo "Setting up Repositories"
echo "============================================="

echo "Installing EPEL as a prequiste for Nordugrid Repos"
yum -y install epel-release

echo "Adding Nordugrid Repository"
rpm -Uvh http://download.nordugrid.org/packages/nordugrid-release/releases/15.03/centos/el7/x86_64/nordugrid-release-15.03-1.el7.centos.noarch.rpm
yum clean all

echo "============================================="
echo "Installing Packages"
echo "============================================="

echo "Installing nordugrid release"
yum -y install nordugrid-release-15.03-1.el7.centos.noarch.rpm

echo "Installing Client tools"
yum -y install nordugrid-arc-client-tools


echo "============================================="
echo "Configuring vo.scotgrid.ac.uk access"
echo "============================================="

mkdir -p /etc/vomses
echo '"vo.scotgrid.ac.uk" "voms.gridpp.ac.uk" "15509" "/C=UK/O=eScience/OU=Manchester/L=HEP/CN=voms.gridpp.ac.uk" "vo.scotgrid.ac.uk"' > /etc/vomses/vo.scotgrid.ac.uk-voms.gridpp.ac.uk
echo '"vo.scotgrid.ac.uk" "voms02.gridpp.ac.uk" "15509" "/C=UK/O=eScience/OU=Oxford/L=OeSC/CN=voms02.gridpp.ac.uk" "vo.scotgrid.ac.uk"' > /etc/vomses/vo.scotgrid.ac.uk-voms02.gridpp.ac.uk
echo '"vo.scotgrid.ac.uk" "voms03.gridpp.ac.uk" "15509" "/C=UK/O=eScience/OU=Imperial/L=Physics/CN=voms03.gridpp.ac.uk" "vo.scotgrid.ac.uk"' > /etc/vomses/vo.scotgrid.ac.uk-voms03.gridpp.ac.uk

mkdir -p /etc/grid-security/vomsdir/vo.scotgrid.ac.uk

cat > /etc/grid-security/vomsdir/vo.scotgrid.ac.uk/voms.gridpp.ac.uk.lsc <<"EOF"
/C=UK/O=eScience/OU=Manchester/L=HEP/CN=voms.gridpp.ac.uk
/C=UK/O=eScienceCA/OU=Authority/CN=UK e-Science CA 2B
EOF

cat > /etc/grid-security/vomsdir/vo.scotgrid.ac.uk/voms02.gridpp.ac.uk.lsc <<"EOF"
/C=UK/O=eScience/OU=Oxford/L=OeSC/CN=voms02.gridpp.ac.uk
/C=UK/O=eScienceCA/OU=Authority/CN=UK e-Science CA 2B
EOF

cat > /etc/grid-security/vomsdir/vo.scotgrid.ac.uk/voms03.gridpp.ac.uk.lsc <<"EOF"
/C=UK/O=eScience/OU=Oxford/L=OeSC/CN=voms03.gridpp.ac.uk
/C=UK/O=eScienceCA/OU=Authority/CN=UK e-Science CA 2B
EOF


echo "Finished..."
