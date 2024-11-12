FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    openssh-server \
    curl \
    vim \
    sudo


RUN useradd -m -s /bin/bash vagrant && echo "vagrant:vagrant" | chpasswd && adduser vagrant sudo
RUN echo 'vagrant ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN  sudo sed -i '/#VAGRANT-BEGIN/,/#VAGRANT-END/d' /etc/fstab || true

ENV DEBIAN_FRONTEND=noninteractive


RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

RUN mkdir -p /home/vagrant/.ssh
COPY ./insecure_public_key /home/vagrant/.ssh/authorized_keys
RUN chown -R vagrant:vagrant /home/vagrant/.ssh
RUN chmod 600 /home/vagrant/.ssh/authorized_keys

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]