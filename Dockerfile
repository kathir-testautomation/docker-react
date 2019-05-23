FROM node:alpine as builder
WORKDIR '/frontends'
COPY /package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /frontends/build /usr/share/nginx/html