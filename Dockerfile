FROM python:3.11-slim-buster
WORKDIR /app
COPY ./poetry.lock ./pyproject.toml /app/
RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction --no-ansi
COPY . /app
EXPOSE 8501
CMD ["streamlit", "run", "app.py"]