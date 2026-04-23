FROM node:20-alpine

WORKDIR /app

# Install build tools needed for native deps (discord.js-selfbot-v13 needs more)
RUN apk add --no-cache python3 make g++ pkgconfig pixman-dev cairo-dev pango-dev libjpeg-turbo-dev giflib-dev librsvg-dev

# Copy package files and install dependencies
COPY package.json package-lock.json* ./
RUN npm install --production

# Default entrypoint
CMD ["sh", "-c", "echo $BOT_CODE_B64 | base64 -d > /app/bot.js && node /app/bot.js"]
