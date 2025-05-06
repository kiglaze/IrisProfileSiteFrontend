FROM node:16-alpine AS build-stage
# Install git
RUN apk add --no-cache git bash

WORKDIR /app

# Define build arguments
ARG GITHUB_USERNAME
ARG GITHUB_PAT
ARG GITHUB_REPO

# Set environment variables from build arguments
ENV GITHUB_USERNAME=${GITHUB_USERNAME}
ENV GITHUB_PAT=${GITHUB_PAT}
ENV GITHUB_REPO=${GITHUB_REPO}

RUN git clone https://${GITHUB_USERNAME}:${GITHUB_PAT}@github.com/kiglaze/IrisProfileSiteFrontend.git IrisProfileSiteFrontend

# Install dependencies and build the project
WORKDIR /app/IrisProfileSiteFrontend
RUN npm install
# Build the Vue app for production
RUN npm run build

FROM nginx:alpine
COPY --from=build-stage /app/IrisProfileSiteFrontend/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
