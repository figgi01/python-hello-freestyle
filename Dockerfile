FROM python:3.6-alpine3.6
WORKDIR /app

ADD requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt


ADD src /app

EXPOSE 80

CMD ["python", "/app/app.py"]
