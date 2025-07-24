# Stage 1: Base Image
FROM python:3.9-slim AS base

# Set working directory
WORKDIR /app

# Copy the requirements.txt file and install dependencies
COPY requirement.txt .
RUN pip install --no-cache-dir -r requirement.txt

# Stage 2: Build Stage
FROM base AS build

# Copy application code into the container
COPY main.py .

# Expose the application port
EXPOSE 5001

# Command to run the application
CMD ["python", "main.py"]
