FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# /app/build   --> has all the stuff we want for production environment


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html