ARG DOCKER_IMAGE

FROM ${DOCKER_IMAGE}
#RUN apt-get update

#ARG USERNAME
#ARG USER_UID
#ARG USER_GID
#ENV USERNAME=${USERNAME}

USER root

# Installing majority of packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends \
     git \
     xdg-utils \
     locales \
     sudo \
     nano \
     vim \
     libtinfo5 \
     ca-certificates \
     tzdata \
     #xinetd \
     update-inetd \
     tftp-hpa \
     apt-utils \
     less \
     wget \
     dpkg

RUN locale-gen en_US.UTF-8

ENV \
     LANG=en_US.UTF-8 \
     LC_ALL=en_US.UTF-8 \
          #some packages will require this to be set. You can change this a rebuild
          #the image is needed
     TZ="America/Detroit" \
     LANGUAGE=en_US.UTF-8

# This script installs the ptlnx environment package dependencies
ADD ../scripts/plnx-env-setup.sh /tmp/plnx-env-setup.sh
RUN ./tmp/plnx-env-setup.sh

# installing missing dependencies
RUN wget http://archive.ubuntu.com/ubuntu/pool/universe/c/chrpath/chrpath_0.16-2_amd64.deb \
https://launchpad.net/~ubuntu-security-proposed/+archive/ubuntu/ppa/+build/21069816/+files/xterm_330-1ubuntu2.2_amd64.deb \
https://launchpad.net/ubuntu/+source/libtext-unidecode-perl/1.30-1/+build/11516484/+files/libtext-unidecode-perl_1.30-1_all.deb \
https://launchpad.net/ubuntu/+source/texinfo/6.5.0.dfsg.1-2/+build/14314107/+files/texinfo_6.5.0.dfsg.1-2_amd64.deb
     
RUN dpkg -i chrpath_0.16-2_amd64.deb \
     libtext-unidecode-perl_1.30-1_all.deb \
     texinfo_6.5.0.dfsg.1-2_amd64.deb \
     xterm_330-1ubuntu2.2_amd64.deb || apt-get -y install -f

# Create the user
# RUN if getent passwd $USER_UID > /dev/null; then userdel -r $(getent passwd $USER_UID | cut -d ':' -f 1); fi \ 
#    && groupadd --force --gid $USER_GID $USERNAME \
#    && useradd --no-log-init --uid $USER_UID --gid $USER_GID -m $USERNAME \
#    && mkdir -p /etc/sudoers.d/ \
#    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
#    && apt-get update \
#    && apt-get install -y sudo \
#    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
#    && chmod 0440 /etc/sudoers.d/$USERNAME


#USER $USERNAME

#WORKDIR /home/${USERNAME}