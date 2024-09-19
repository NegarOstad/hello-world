# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files to the container
COPY . .

# Build the app for production
RUN npm run build

# Install a lightweight server to serve the app
RUN npm install -g serve

# Expose port 3000
EXPOSE 3000


# Command to serve the production build
CMD ["serve", "-s", "build", "-l", "3000"]
