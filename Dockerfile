# FROM codercom/code-server:v2
FROM codercom/code-server:2.1698-vsc1.41.1

FROM drighart/workbench-python-java-base:latest

RUN apt-get update && apt-get install -y \
	openssl \
	net-tools \
	git \
	locales \
	sudo \
	dumb-init \
	vim \
	curl \
	wget \
  tzdata

RUN locale-gen en_US.UTF-8
# We cannot use update-locale because docker will not use the env variables
# configured in /etc/default/locale so we need to set it manually.
ENV LC_ALL=en_US.UTF-8

RUN adduser --gecos '' --disabled-password coder && \
	echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

#===================
# Timezone settings
# Possible alternative: https://github.com/docker/docker/issues/3359#issuecomment-32150214
#===================
ENV TZ "Europe/Amsterdam"
RUN echo "${TZ}" > /etc/timezone \
  && dpkg-reconfigure --frontend noninteractive tzdata
  
USER coder
# We create first instead of just using WORKDIR as when WORKDIR creates, the
# user is root.
#RUN mkdir -p /home/coder/project

WORKDIR /home/coder

# This ensures we have a volume mounted even if the user forgot to do bind
# mount. So that they do not lose their data if they delete the container.
#VOLUME [ "/home/coder/project" ]

COPY --from=0 /usr/local/bin/code-server /usr/local/bin/code-server
EXPOSE 8080

ENTRYPOINT ["dumb-init", "code-server", "--host", "0.0.0.0"]
