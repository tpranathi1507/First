FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the simple Flask application to the working directory
COPY main.py .

# Install Flask
RUN pip install Flask

# Command to run on container start
CMD ["python", "main.py"]

