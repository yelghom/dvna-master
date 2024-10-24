# Use the official Node.js image as the base image
FROM node:20

# Set the working directory
WORKDIR /DVNA-MASTER

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

RUN npm rebuild bcrypt --build-from-source
RUN npm rebuild libxmljs --build-from-source


# Expose the port your app runs on
EXPOSE 3000

# Set the default command to start the app
CMD ["npm", "start"]