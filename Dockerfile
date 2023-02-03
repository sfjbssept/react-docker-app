#stage 1  it will build a react app 
FROM node:16 as Build
WORKDIR /app
COPY . . 
RUN npm install && npm run build

# stage 2 serve the static files nginx
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html