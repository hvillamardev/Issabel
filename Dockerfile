#docker build -t hvillamar/issabel:latest .

FROM centos/systemd

VOLUME [ "/sys/fs/cgroup" ]

RUN yum update; yum -y install kernel-devel-$(uname -r) libtool make gcc patch perl bison flex-devel gcc-c++ ncurses-devel flex libtermcap-devel autoconf automake* autoconf libxml2-devel cmake curl epel-release htop glances screen fail2ban-server wget sysstat net-tools setroubleshoot; yum clean all 

WORKDIR /usr/src 

RUN curl -LOs "https://sourceforge.net/projects/issabelpbx/files/Issabel 4/issabel-netinstall.sh" && chmod 777 issabel-netinstall.sh && ln -s issabel-netinstall.sh install.sh

EXPOSE 10000-20000/udp 110 143 25 2727/udp 89/tcp 80/tcp 443/tcp 8433/tcp 4569/udp 5004-5082/udp 993 995

CMD ["/usr/sbin/init"]