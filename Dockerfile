FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache python3 make g++

COPY package.json package-lock.json* ./
RUN npm install --production

CMD ["sh", "-c", "echo $BOT_CODE_B64 | base64 -d > /app/bot.js && npm install discord.js-selfbot-v13 --no-save --no-audit --no-fund 2>/dev/null; node /app/bot.js"]
