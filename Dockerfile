FROM registry.access.redhat.com/ubi8/python-311

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the models directory to the working directory
COPY models/ models/

# Copy the rest of the application to the working directory
COPY . .

# Command to run on container start
CMD ["python", "main.py"]
