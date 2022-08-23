FROM oraclelinux:8.5

RUN dnf clean all
RUN dnf update -yq
RUN dnf install -y epel-release
RUN dnf install -y libaio \
    dmidecode \
    net-tools \
    wget \
    telnet \
    vim \
    nano \
    tar \
    unzip \
    python2 \
    glibc.i686 \
    libicu \
    libuuid.so.1 \
    libstdc++.so.6 \
    libfontconfig.so.1 \
    libgthread-2.0.so.0 \
    libXext.i686 \
    libXrender.i686 \
    libSM.i686 \
    libX11.x86_64 \
    libICE.x86_64 \
    libSM.x86_64 \
    libXau.x86_64 \
    libXext.x86_64 \
    libXrender.x86_64 \
    libxcb.x86_64 \
    ncurses-compat-libs-6.1-9.20180224.el8.x86_64 \
    unixODBC-devel

RUN mkdir -p /protheus/apo

ENV FONTCONFIG_PATH=/etc/fonts
ENV LD_LIBRARY_PATH=/protheus/bin:.

COPY . /
RUN chmod +x /usr/local/bin/* /usr/bin/*

ENV FONTCONFIG_PATH=/etc/fonts
ENV LD_LIBRARY_PATH=/protheus/bin:.

EXPOSE 8080 8081

VOLUME ["/volume/protheus_data", "/volume/apo/"]

WORKDIR /protheus/bin

ENTRYPOINT /usr/local/bin/protheus-init.sh
