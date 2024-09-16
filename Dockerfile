FROM python:3-slim
RUN pip install poetry

RUN groupadd -g 1234 feediverse && useradd -m -u 1234 -g feediverse feediverse

RUN mkdir /config /app
RUN chown -R feediverse:feediverse /config /app

WORKDIR /app
USER feediverse
COPY . .
RUN poetry install

ENTRYPOINT ["poetry", "run", "feediverse", "-c", "/config/config"]
