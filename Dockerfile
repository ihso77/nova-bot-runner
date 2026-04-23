FROM node:20-alpine

WORKDIR /app

# Install build tools for native deps
RUN apk add --no-cache python3 make g++

# Copy package files and install dependencies
COPY package.json package-lock.json* ./
RUN npm install --production

# Force install common extra packages bots may need
RUN npm install discord.js-selfbot-v13 2>/dev/null || true

CMD ["sh", "-c", "echo $BOT_CODE_B64 | base64 -d > /app/bot.js && node /app/bot.js"]
