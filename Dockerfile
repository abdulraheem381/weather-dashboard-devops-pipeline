# Step 1: Build React app
FROM node:18-alpine AS build

WORKDIR /app
COPY package*.json yarn.lock ./
RUN yarn install
COPY . .

ENV NODE_OPTIONS=--openssl-legacy-provider

RUN yarn build

# Step 2: Serve with Nginx
FROM nginx:alpine

# Copy build files to nginx html directory
COPY --from=build /app/build /usr/share/nginx/html

# Copy custom nginx config
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
