FROM python:alpine

COPY requirements.txt /tmp/requirements.txt 

COPY demo/ /opt/demo/

COPY polls/ /opt/polls/

COPY db.sqlite3 /opt/db.sqlite3

RUN pip install -Ur /tmp/requirements.txt

RUN rm -rf /tmp/requirements.txt

COPY manage.py /opt/manage.py

RUN python3 opt/manage.py migrate

CMD python3 opt/manage.py runserver 0.0.0.0:8000
#CMD ["python3", "/opt/manage.py"]

