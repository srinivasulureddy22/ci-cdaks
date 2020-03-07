# stage 0
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 1
FROM nginx:alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html
