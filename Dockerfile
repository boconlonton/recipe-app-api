#Which image to be based
FROM python:3.7-alpine

#Who maintaining the project
MAINTAINER bocon

#This env var used for running Python docket
ENV PYTHONUNBUFFERED 1

#Copy content of our requirements to docker requirement file
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

#Setup docker directory
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Create the user for running the app only
# For security, avoid running the app by root user
RUN adduser -D user
USER user
