FROM python:alpine

COPY requirements.txt /tmp/requirements.txt 

RUN pip install -Ur /tmp/requirements.txt

RUN rm -rf /tmp/requirements.txt

COPY flaskapp.py /opt/flaskapp.py

CMD ["python", "/opt/flaskapp.py"]
