FROM node:12

# # создание директории приложения
RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app/

# # установка зависимостей
# # символ астериск ("*") используется для того чтобы по возможности 
# # скопировать оба файла: package.json и package-lock.json
# COPY package*.json ./
COPY . /usr/src/app/


# RUN npm install
# # Если вы создаете сборку для продакшн
RUN npm ci --only=production

# # копируем исходный код
# COPY . .

# Установить часовой пояс 
# Способ №1
# ENV TZ Europe/Moscow
# Способ №2
# -e TZ=Europe/Moscow 

# --rm удалить контейнер после его остановки 
# docker rmi <id>||<name> удалить image 
# --name <name> задаем имя контейнеру
# -p <0000*4200>:<0000*EXPOSE 8080>  устанавливаем порт  
#  docker run --rm --name <name> -p <0000>:<0000>
EXPOSE 8080
CMD [ "node", "server.js"]