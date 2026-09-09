FROM node:26-bookworm-slim

RUN npm install -g @nestjs/cli

WORKDIR /app

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]