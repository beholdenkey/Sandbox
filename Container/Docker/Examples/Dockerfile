FROM sat68.s3i.org:5000/udn-red_hat_containers-ubi8
RUN dnf install wget unzip -y
RUN wget -O /etc/pki/ca-trust/source/anchors/ent_certs.zip http://devpi.s3i.org:9000/ent_certs.zip --no-check-certificate
RUN echo yes | unzip /etc/pki/ca-trust/source/anchors/ent_certs.zip -d /etc/pki/ca-trust/source/anchors/
RUN update-ca-trust
RUN dnf install bind bind-utils dhcp-server chrony nginx tftp-server tftp iputils nano python3 python3-devel openssh -y
RUN mkdir /etc/dhcp/rndc-keys/
# DHCP Server
COPY dhcp/rndc.key /etc/rndc.key
COPY dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf
COPY dhcp/rndc.key /etc/dhcp/rndc-keys/rndc.key
# NGINX
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY tftp-server/tftp-server.service /etc/systemd/system/tftp-server.service
COPY tftp-server/tftp-server.socket /etc/systemd/system/tftp-server.socket
# DNS Server
COPY bind/resolv.conf /etc/resolv.conf
COPY bind/named.conf /etc/named.conf
COPY bind/oob.udn.dev.zone /var/named/oob.udn.dev.zone
COPY bind/0.1.10.in-addr.arpa.zone /var/named/0.1.10.in-addr.arpa.zone
RUN chown :named -R /var/named/
RUN chown :named -R /etc/named.conf
RUN dnf clean all
# Start services
RUN systemctl enable chronyd
RUN systemctl enable dhcpd
RUN systemctl enable nginx
RUN systemctl enable tftp-server
RUN systemctl enable named
CMD [ "/sbin/init" ]