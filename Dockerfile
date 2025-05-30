FROM python:3-alpine

WORKDIR /app

# Install uv
RUN pip install uv

COPY pyproject.toml .
COPY uv.lock .

RUN uv sync

COPY main.py .

CMD ["/app/.venv/bin/python", "main.py"]
EXPOSE 8181