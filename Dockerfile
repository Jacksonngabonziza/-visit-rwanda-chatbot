FROM rasa/rasa:3.0.8-full

WORKDIR /app

COPY ./*.yml /app/
COPY ./data /app/data/
COPY ./tests /app/tests/
COPY ./models /app/models/

VOLUME /app
VOLUME /app/data
VOLUME /app/models

WORKDIR /app
CMD ["run","-m","/app/models","--credentials","/app/credentials.yml","--endpoints","/app/endpoints.yml","--enable-api","--cors","*","--debug"]