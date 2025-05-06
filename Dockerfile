FROM node:16-alpine AS build-stage
# Install git
RUN apk add --no-cache git

WORKDIR /app

# Define build arguments
ARG GITHUB_USERNAME
ARG GITHUB_PAT
ARG GITHUB_REPO

RUN git clone https://kiglaze:${GITHUB_PAT}@${GITHUB_REPO} .

RUN npm install
# Build the Vue app for production
RUN npm run build

FROM nginx:alpine
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
