
FROM fedora:latest

RUN \
   dnf -y update 

RUN \
   dnf -y install dh-autoreconf curl-devel expat-devel gettext-devel \
  openssl-devel perl-devel zlib-devel && \
   dnf -y install asciidoc xmlto docbook2X man && \
   ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

RUN \
   mkdir /repos && \
   cd /repos && \
   git clone https://github.com/git/git

RUN \
   cd /repos/git && \
   make configure && \
   ./configure --prefix=/usr && \
   make all doc info && \
   make install install-doc install-html install-info

CMD ["/bin/bash"]
