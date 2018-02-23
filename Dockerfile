FROM ubuntu:16.04
LABEL maintainer="Anshuman Bhartiya"

RUN apt-get update

RUN apt-get install -y libldns-dev git build-essential wget python3 python python-setuptools python-dev
RUN easy_install pip

WORKDIR /

RUN git clone https://github.com/infosec-au/altdns.git

WORKDIR /altdns
RUN pip install -r requirements.txt

ADD words2.txt .

RUN chmod +x altdns.py

ENTRYPOINT ["./altdns.py"]