FROM ubuntu:22.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq debconf-utils apt-utils netcat mtr zsh httpie dnsutils inetutils-* net-tools curl wget nano tcpdump tshark subversion python3 groovy nodejs npm mysql-client avahi-utils ldap-utils && apt-get clean

RUN git clone --recursive --depth 1 https://github.com/gitreelike/prezto.git $HOME/.zprezto
RUN zsh -c 'setopt EXTENDED_GLOB && for rcfile in $HOME/.zprezto/runcoms/^README.md(.N); do ln -s "$rcfile" $HOME/.${rcfile:t}; done'
RUN chsh -s /bin/zsh

CMD ["zsh"]
