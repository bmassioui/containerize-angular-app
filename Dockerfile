FROM node:16.13.1 as base
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod & npm audit fix

#stage 2
FROM nginx:alpine
COPY --from=base /app/dist/containerize-angular-app /usr/share/nginx/html

EXPOSE 80