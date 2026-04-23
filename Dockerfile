FROM node:20-alpine

WORKDIR /app

# Install build tools for native deps
RUN apk add --no-cache python3 make g++

# Copy package files and install dependencies
COPY package.json package-lock.json* ./
RUN npm install --production

CMD ["sh", "-c", "echo $BOT_CODE_B64 | base64 -d > /app/bot.js && npm install --prefer-offline --no-audit --no-fund 2>/dev/null; node /app/bot.js"]
