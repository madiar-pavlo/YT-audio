#!/bin/bash

echo "Установка необходимых инструментов для работы..."

# Обновляем пакеты
pkg update && pkg upgrade -y

# Установка yt-dlp
if ! command -v yt-dlp &> /dev/null; then
  echo "Устанавливаю yt-dlp..."
  pkg install yt-dlp -y
else
  echo "yt-dlp уже установлен."
fi
d
# Установка ffmpeg
if ! command -v ffmpeg &> /dev/null; then
  echo "Устанавливаю ffmpeg..."
  pkg install ffmpeg -y
else
  echo "ffmpeg уже установлен."
fi

echo "Установка завершена. Теперь вы можете использовать yt-music-downloader.sh"
