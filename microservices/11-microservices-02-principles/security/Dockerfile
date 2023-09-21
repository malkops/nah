FROM python:3.9-alpine
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --force-reinstall -r requirements.txt 
COPY src ./

CMD [ "python", "./server.py" ]