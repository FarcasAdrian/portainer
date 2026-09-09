#!/bin/sh

if [ -z "$(ls -A /app 2>/dev/null)" ]; then
    echo "Creating NestJS project..."
    nest new . --skip-git --package-manager npm
else
    echo "Existing project found."
fi

npm install

exec npm run start:dev