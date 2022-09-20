# --- BUILDER STAGE --- #
FROM alpine:latest AS builder

# Install necessary dependencies
RUN apk --no-cache --update add nodejs npm bash curl
RUN curl -sf https://gobinaries.com/tj/node-prune | sh

# Create new working directory, copy package.json and install dependencies
WORKDIR /usr/src/app
COPY package.json .
RUN npm install

# Copy the remaining source code files + run build
COPY . .
RUN npm run build

# Cleanup node_modules
RUN rm -rf node_modules && npm install --omit=dev && node-prune

# --- RUNNER STAGE --- #
FROM alpine:latest AS runner
RUN apk --no-cache --update add nodejs npm
RUN rm -rf /var/cache/apk/*

# Copy everything we need
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/dist ./dist
COPY --from=builder /usr/src/app/node_modules ./node_modules

# Run it!
EXPOSE 3000
CMD [ "node", "./dist/main.js" ]
