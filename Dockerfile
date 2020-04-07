from jenkins/jenkins:lts

USER root

RUN apt-get install

RUN apt-get update 


RUN wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip

RUN unzip ./terraform_0.12.24_linux_amd64.zip -d /usr/local/bin/

RUN terraform -v

RUN apt-get install -y python3-pip

RUN pip3 install ansible

RUN ansible --version