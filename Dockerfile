FROM python:3.11.7-slim-bullseye
WORKDIR /app

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

COPY ./requirements.txt /app/
# install system dependencies
RUN apt-get update && apt-get install -y libpq-dev
# install dependencies
RUN pip install --upgrade pip
RUN pip install essentials
RUN pip install psycopg2
RUN pip install psycopg2-binary
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

ENTRYPOINT ["gunicorn", "core.wsgi", "-b", "0.0.0.0:8000"]