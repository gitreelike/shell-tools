FROM ubuntu:16.04

RUN apt-get update && apt-get install -yq debconf-utils apt-utils
RUN apt-get update && apt-get install -yq netcat mtr zsh httpie dnsutils inetutils-* net-tools
RUN apt-get update && apt-get install -yq vim nano
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq tcpdump tshark
RUN apt-get update && apt-get install -yq git subversion
RUN apt-get update && apt-get install -yq python groovy nodejs npm

RUN apt-get clean

RUN git clone --recursive --depth 1 https://github.com/gitreelike/prezto.git $HOME/.zprezto
RUN zsh -c 'setopt EXTENDED_GLOB && for rcfile in $HOME/.zprezto/runcoms/^README.md(.N); do ln -s "$rcfile" $HOME/.${rcfile:t}; done'
RUN chsh -s /bin/zsh

CMD ["zsh"]
