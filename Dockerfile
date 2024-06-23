FROM python:3.11.7-slim-buster

WORKDIR /app

COPY . /app

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# install system dependencies
RUN apt-get update

# install dependencies
RUN pip install --upgrade pip
#COPY requirements.txt /app/
RUN pip install -r requirements.txt

ENTRYPOINT ["gunicorn", "my_project.wsgi", "-b", "0.0.0.0:8000"]