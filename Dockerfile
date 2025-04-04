FROM node:20 as build

ENV HOME=/home/app
WORKDIR $HOME

COPY package.json ./
COPY package-lock.json ./

RUN npm install -g npm@8.19.3
RUN npm install --legacy-peer-deps

COPY . .

RUN npm run build

FROM node:20-slim

RUN npm install -g serve

WORKDIR /app

COPY --from=build /home/app/build ./build

CMD ["serve", "-s", "build"]
