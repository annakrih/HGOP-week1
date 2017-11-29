# Defines an base image from which the build process starts. 
 # (followed by various other methods, commands and 
 # arguments that in return provide a new image which 
 # is to be used for creating docker container)
 # this base image contains Node.js - edition Carbon 8
FROM node:carbon

# Set the working directory to /code
WORKDIR /code

# Copies the file package.json from source to destination,
# that is the filesystem of the container. 
COPY package.json package.json

# Copies the file app.js from source to the container
COPY app.js app.js

# Runs the command "npm install" which installs all modules listed as dependencies in package.jason
RUN npm install

# CMD provides defaults for an executing container.
# it sets the command to be executed when running the image.
# When running the image the file app.js is executed.
CMD node app.js

