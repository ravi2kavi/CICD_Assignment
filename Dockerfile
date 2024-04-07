# Use an existing base image from Docker Hub
FROM python:3.8

# Set the working directory inside the container
WORKDIR /cicd_assignment

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Command to run when the container starts
CMD ["python", "train.py"]
