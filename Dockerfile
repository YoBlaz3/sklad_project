FROM python:3.8-slim-buster
WORKDIR /myapp
COPY . /myapp
RUN pip install -r requirements.txt
ENV FLASK_APP=/myapp/app/app.py
ENV FLASK_RUN_HOST=0.0.0.0
EXPOSE 5000
WORKDIR /flyway
RUN apt-get update && \
    apt-get install -y wait-for-it && \
    wget -qO- https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/7.0.0/flyway-commandline-7.0.0-linux-x64.tar.gz | tar xvz && \
    ln -s /flyway/flyway-7.0.0/flyway /usr/local/bin/flyway && \
    apt-get remove -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Возвращаемся в /app
WORKDIR /myapp

# Запускаем миграцию приложения
CMD ["bash", "-c", "wait-for-it mysql:3306 -- flyway validate -url=jdbc:mysql://mysql:3306/sklad-user=root -password=root && flyway migrate -url=jdbc:mysql://mysql:3306/sklad -user=root -password=root -locations=filesystem:/app/sklad && python -m flask run --host=0.0.0.0"]
