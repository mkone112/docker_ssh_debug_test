FROM python:3.10
WORKDIR /app/

COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY app.py .
COPY cmd.sh .


# Start and enable SSH
RUN apt-get update \
    && apt-get install -y --no-install-recommends dialog \
    && apt-get install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd \
    && chmod u+x /app/cmd.sh
COPY sshd_config /etc/ssh/

EXPOSE 8000 2222

ENTRYPOINT [ "/app/cmd.sh" ]