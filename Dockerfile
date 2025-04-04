FROM node:20 as build

ENV HOME=/home/app
WORKDIR $HOME

COPY package.json ./
RUN npm install -g npm@8.19.3
RUN npm install --legacy-peer-deps

COPY . ./
RUN npm install serve -g
RUN npm run build
CMD ["serve", "-s", "build"]