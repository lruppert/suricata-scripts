#!/bin/sh
#
#
# This handles the suricata-building stuff using pfring detailed on Martin
# Holste's web site.
#
# If needed, we get the proxy squared away up front:
#
http_proxy=
export http_proxy

# We choose what version.
SURICATAVERSION=1.4rc1
#

#
# Now we take care of suricata
#
#
cd /usr/local/src
wget http://www.openinfosecfoundation.org/download/suricata-${SURICATAVERSION}.tar.gz
tar -xzf suricata-${SURICATAVERSION}.tar.gz
cd suricata-${SURICATAVERSION}
./configure --enable-pfring --enable-prelude --prefix=/usr/local/suricata/${SURICATAVERSION} --with-libpfring-includes=/usr/local/pfring/include --with-libpfring-libraries=/usr/local/pfring/lib --with-libpcap-includes=/usr/local/pfring/include/pcap --with-libpcap-libraries=/usr/local/pfring/lib
make -j 16 && make install
if [ ! -d /etc/suricata/rules ]; then
mkdir -p /etc/suricata/rules
fi

if [ ! -d /var/log/suricata ]; then
mkdir /var/log/suricata
fi

if [ ! -f /usr/local/suricata/current ]; then
ln -s /usr/local/suricata/${SURICATAVERSION} /usr/local/suricata/current
fi
#
# Customizations are still needed. We do those by hand. Don't forget!
#
echo Suricata still needs to be customized
