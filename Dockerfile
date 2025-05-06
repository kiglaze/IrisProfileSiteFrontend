FROM node:16-alpine AS build-stage
# Install git
RUN apk add --no-cache git bash

WORKDIR /app
COPY . /app

# Install dependencies and build the project
WORKDIR /app/IrisProfileSiteFrontend
COPY . /app/IrisProfileSiteFrontend
RUN npm install
# Build the Vue app for production
RUN npm run build

RUN ls -l /app/IrisProfileSiteFrontend

FROM nginx:alpine
COPY --from=build-stage /app/IrisProfileSiteFrontend/dist /usr/share/nginx/html
EXPOSE 80
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
