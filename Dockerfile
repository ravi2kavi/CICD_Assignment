# Use an existing base image from Docker Hub
FROM python:3.11

# Set the working directory inside the container
WORKDIR /cicd_assignment

COPY ./cicd_assignment

# Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Train the model during the build phase
RUN python train.py

# Command to run when the container starts
CMD ["python", "test.py"]
