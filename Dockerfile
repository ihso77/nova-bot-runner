FROM node:20-alpine

WORKDIR /app

# Build tools for native modules
RUN apk add --no-cache python3 make g++

# Install base + common extra packages
COPY package.json ./
RUN npm install --production

CMD ["sh", "-c", "echo $BOT_CODE_B64 | base64 -d > /app/bot.js && node /app/bot.js"]
