FROM python:3.10-slim

WORKDIR /app

# Установим системные зависимости и gdown
RUN apt-get update && \
    apt-get install -y git curl && \
    pip install gdown

# Копируем файлы проекта
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Запускаем скрипт для загрузки весов
RUN chmod +x weights_download.sh && ./weights_download.sh

CMD ["python", "main.py"]
