FROM python:3.9
RUN useradd -ms /bin/sh -u 1001 app_user
USER app_user

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY --chown=app_user:app ./app /app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
