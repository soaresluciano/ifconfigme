FROM python:3-alpine

WORKDIR /app

# Install uv
RUN pip install uv

COPY pyproject.toml .
COPY uv.lock .

RUN uv sync uv.lock

COPY main.py .

CMD ["python", "main.py"]
EXPOSE 8080