FROM ubuntu:18.04
ENV REFRESHED_AT 2018-11-08

LABEL maintainer="Pierre Navaro <navaro@math.cnrs.fr>"

RUN apt-get update --fix-missing && \
    apt-get install -y \ 
    make \
    pandoc \
    texlive-xetex \
    texlive-lang-french \
    texlive-fonts-extra \
    mkdocs mkdocs-bootstrap && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -m -s /bin/bash euler
ENV HOME /home/euler
RUN chown -R euler:euler /home/euler
USER euler
WORKDIR $HOME

CMD /bin/bash
