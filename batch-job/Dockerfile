# Node.js Base Image
FROM node:boron

# Create AWS Batch Job Work Directory
WORKDIR /usr/src/app

# Copy package.json into Work Directory
COPY package.json /usr/src/app

# Install AWS Batch Job Dependencies
RUN npm install

# Bundle AWS Batch Job Source
COPY . /usr/src/app

# Run AWS Batch Job
CMD [ "node", "index" ]