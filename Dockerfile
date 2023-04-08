FROM node:18.14.1-alpine3.17

WORKDIR /app
COPY . /app
RUN yarn --frozen-lockfile

FROM node:18.14.1-alpine3.17

WORKDIR /app
COPY --from=0 /app /app
CMD [ "/app/node_modules/.bin/koishi", "start" ]
