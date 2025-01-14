#!/bin/bash

# Проверяем доступ к хранилищу
if [ ! -d ~/storage/music ]; then
  echo "Настраиваем доступ к хранилищу..."
  termux-setup-storage
  sleep 3
  if [ ! -d ~/storage/music ]; then
    echo "Ошибка: доступ к хранилищу не настроен."
    exit 1
  fi
fi

# Проверяем наличие URL
if [ -z "$1" ]; then
  echo "Использование: $0 <URL видео YouTube>"
  exit 1
fi

# Скачиваем видео с отображением прогресса и конвертируем в mp3
echo "Скачивание и конвертация видео..."
yt-dlp -x --audio-format mp3 --progress --output "%(title)s.%(ext)s" "$1"

# Получаем имя загруженного файла
FILENAME=$(yt-dlp --get-title "$1")
FILENAME="${FILENAME}.mp3"

# Проверяем наличие файла и перемещаем его
if [ -f "$FILENAME" ]; then
  mv "$FILENAME" ~/storage/music/
  echo "Готово! Файл '$FILENAME' перемещён в папку Music."
else
  echo "Ошибка: файл '$FILENAME' не найден."
fi