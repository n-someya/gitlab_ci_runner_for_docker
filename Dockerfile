FROM sameersbn/gitlab-ci-multi-runner:1.1.4-7

RUN apt-get -y update && apt-get -y install \
  build-essential \
  linux-image-extra-virtual \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common &&\
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" &&\
   apt-get update && apt-get install -y docker-ce
