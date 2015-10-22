FROM debian:jessie

MAINTAINER Alexis Vincent <alexis@alexisvincent.io>

# Distro
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update

# Common packages
RUN apt-get install -q -y					\
    	    sudo										\
    	    wget										\
					vim											\
					&& apt-get clean -q -y

