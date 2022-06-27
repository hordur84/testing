FROM node:18-alpine3.15 as p1
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=p1 /app/build /usr/share/nginx/html