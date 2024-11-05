# Dockerfile

# Use an official Python runtime as a parent image
FROM python:3.8-slim


# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Add 'src' to the PYTHONPATH
#ENV PYTHONPATH "${PYTHONPATH}:/app/src"

# Expose ports for Jupyter and MLflow
EXPOSE 8888 5000

# Command to start Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser"]
