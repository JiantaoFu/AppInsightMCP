# Build stage
FROM node:22-alpine AS builder

WORKDIR /app

COPY src/ /app/src
COPY package.json package-lock.json /app
RUN --mount=type=cache,target=/root/.npm npm install
RUN --mount=type=cache,target=/root/.npm-production npm ci --ignore-scripts --omit-dev

# Production stage
FROM node:22-alpine AS release

WORKDIR /app

COPY --from=builder /app/src /app/src
COPY --from=builder /app/package.json /app/package.json
COPY --from=builder /app/package-lock.json /app/package-lock.json

ENV NODE_ENV=production

# Install only production dependencies
RUN npm ci --ignore-scripts --omit-dev

ENTRYPOINT ["node", "/app/src/server.js"]

