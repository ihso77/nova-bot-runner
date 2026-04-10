FROM node:20-alpine

WORKDIR /app

# Install build tools needed for discord.js native deps
RUN apk add --no-cache python3 make g++

# Copy package files and install dependencies
COPY package.json package-lock.json* ./
RUN npm install --production

# Default entrypoint: reads bot code from BOT_CODE_B64 env var
CMD ["sh", "-c", "echo $BOT_CODE_B64 | base64 -d > /app/bot.js && node /app/bot.js"]
