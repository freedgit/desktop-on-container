FROM fedora:36
MAINTAINER The Maintainer the@maintainer.com

ENV \
	THE_UUID=22222 \
	THE_GID=22222 \
	THE_USERNAME=ffff \
	THE_STARTUP_SCRIPT=/user.sh

RUN sed -i -e '/tsflags=nodocs/s/^/#/' /etc/yum.conf /etc/dnf/dnf.conf || true

# first a hearty upgrade.
RUN yum upgrade -y

# large-ish packages go first.

RUN dnf install -y firefox
RUN dnf install -y libreoffice
RUN dnf install -y emacs
RUN dnf install -y gimp

# then all the others at once.
RUN dnf install -y \
  WindowMaker \
  dia \
  evince \
  gedit \
  gnome-system-monitor \
  iproute \
  motif \
  openssh-server \
  openssl \
  pavucontrol \
  procps \
  thunar \
  tigervnc-server \
  vim \
  which \
  xauth \
  xrandr \
  xset \
  xsetroot \
  xterm 

COPY startup.sh /

CMD bash /startup.sh

EXPOSE 22
EXPOSE 5901
EXPOSE 9100

