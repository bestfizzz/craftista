# Use latest Node.js version (21 as of now)
FROM node:21

# Set working directory
WORKDIR /app

# Copy all files
COPY . .

# Install dependencies
RUN npm install

# Expose the port the app listens on
EXPOSE 3000

# Run the app
CMD ["node", "app.js"]
