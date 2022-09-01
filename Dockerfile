FROM python:3.6.1-alpine
RUN pip install --upgrade pip

WORKDIR /app

COPY ./src/requirements.txt /app/
RUN pip install -r requirements.txt

COPY ./src/ /app/

ENV MONGODB_DB=$MONGODB_DB
ENV MONGODB_HOST=$MONGODB_HOST
ENV MONGODB_PORT=$MONGODB_PORT
ENV MONGODB_USERNAME=$MONGODB_USERNAME
ENV MONGODB_PASSWORD=$MONGODB_PASSWORD

CMD ["python","app.py"]
