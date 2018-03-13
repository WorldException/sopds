FROM python:3.6-jessie

LABEL author="Dmitry Shelepnev admin@sopds.ru"
LABEL devops="Evgeny Stoyanov quick.es@gmail.com"
LABEL name="SOPDS books catalog"
LABEL url="http://www.sopds.ru"

COPY . /sopds
WORKDIR /sopds/py
RUN chmod +x /sopds/entrypoint.sh \
    && apt update \
    && apt install -y mysql-client \
    && pip install mysql-connector-python \
    && rm -f /sopds/conf/sopds.conf
ENTRYPOINT [ "/sopds/entrypoint.sh" ]
CMD [ "server" ]