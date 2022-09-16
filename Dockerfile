FROM ubuntu:20.04

LABEL maintainer="Pierre Navaro <navaro@math.cnrs.fr>"

ENV DEBIAN_FRONTEND=noninteractive
ENV REFRESHED_AT 2016-07-01

RUN apt-get update --fix-missing && \
    apt-get install -yq \ 
    make \
    pandoc \
    texlive-xetex \
    texlive-lang-french \
    texlive-fonts-extra \
    python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -m -s /bin/bash euler
ENV HOME /home/euler
RUN chown -R euler:euler /home/euler
USER euler
WORKDIR $HOME
RUN pip3 install --user mkdocs

CMD /bin/bash
