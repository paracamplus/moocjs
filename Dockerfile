FROM node
WORKDIR /home/
COPY package.json .
RUN npm install
CMD [ "npm", "start" ]

