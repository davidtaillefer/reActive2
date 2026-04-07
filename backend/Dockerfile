FROM python:3.11-slim

WORKDIR /app

# Install system deps if needed (e.g. for mysqlclient)
RUN apt-get update && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#COPY ../backend/fit_sdk/Profile.xlsx backend/fit_sdk/Profile.xlsx
#RUN python ../backend/scripts/generate_device_map.py

COPY . .

# Environment variables
ENV FLASK_APP=wsgi.py
ENV PYTHONUNBUFFERED=1

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "wsgi:app"]