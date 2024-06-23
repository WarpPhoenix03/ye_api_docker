FROM python:3.11.7-slim

WORKDIR /app

COPY requirements.txt /app/

RUN apt-get update && apt-get install -y libpq-dev

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY. /app/

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

ENTRYPOINT ["gunicorn", "my_project.wsgi", "-b", "0.0.0.0:8000"]