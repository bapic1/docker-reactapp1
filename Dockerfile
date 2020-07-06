FROM node:alpine as buildstage
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=buildstage /app/build /usr/share/nginx/html

# second dockerfile entries with changes. do not use unless required and AWS
# FROM node:alpine
# WORKDIR '/app'
# COPY package*.json ./
# RUN npm install
# COPY . .
# RUN npm run build

# FROM nginx
# EXPOSE 80
# COPY --from=0 /app/build /usr/share/nginx/html