FROM node:20-alpine

ENV DIR /bot
WORKDIR $DIR

# Directories for persistent data and configuration
RUN mkdir -p ./data ./config ./logs ./instances

# Install dependencies
COPY package*.json ./package.json

# Omit dev dependencies
RUN npm install --production

# Copy source files
COPY . .

ENV NODE_ENV=production

# Application entry point
ENTRYPOINT ["node", "run-forever"]
