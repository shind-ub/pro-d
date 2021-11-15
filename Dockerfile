FROM ubuntu:20.10

ARG DEBIAN_FRONTEND=noninteractive 

RUN apt-get update \
    && apt-get install -y  \
        python3 \ 
        python3-pip \
        git \
    && apt-get clean

COPY requirements.txt tmp/requirements.txt
RUN pip3 install -r tmp/requirements.txt && rm tmp/requirements.txt

WORKDIR /opt/app 
COPY . .

CMD [ "echo", "test" ]