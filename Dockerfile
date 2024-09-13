FROM python:3-slim
RUN pip install poetry
RUN mkdir /config

COPY . .
RUN poetry install

ENTRYPOINT ["poetry", "run", "feediverse", "-c", "/config/config"]
