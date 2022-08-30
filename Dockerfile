FROM python:3.8-slim-buster
WORKDIR /app

RUN python3 -m pip install --upgrade pip

COPY ./src/requirements.txt /app/
RUN pip install -r requirements.txt

COPY ./src/ /app/

ENV MONGODB_DB=$MONGODB_DB
ENV MONGODB_HOST=$MONGODB_HOST
ENV MONGODB_PORT=$MONGODB_PORT
ENV MONGODB_USERNAME=$MONGODB_USERNAME
ENV MONGODB_PASSWORD=$MONGODB_PASSWORD

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
