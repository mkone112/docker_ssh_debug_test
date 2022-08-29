FROM python:3.10
COPY app.py .
COPY requirements.txt .
COPY cmd.sh /
RUN apt-get update && apt-get install openssh-server sudo -y && useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test

RUN  echo 'test:test' | chpasswd

RUN service ssh start

EXPOSE 22

ENV PIP_DISABLE_PIP_VERSION_CHECK=1
RUN pip install --no-cache-dir -r requirements.txt

CMD ["/cmd.sh"]

