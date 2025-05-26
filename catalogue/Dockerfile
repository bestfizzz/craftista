# Use a Python base image
FROM python:3.10-slim

# Set working directory inside the container
WORKDIR /app

# Copy all files from the host machine to the container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 for the Flask app
EXPOSE 5000

# Use Gunicorn to run the app
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000"]
