# Use an existing base image with necessary dependencies for training
FROM python:3.8

# Set the working directory inside the container
WORKDIR /cicd_assignment

# Copy the entire repository into the container
COPY . .

# Install any required dependencies (assuming they are in requirements.txt)
RUN pip install --no-cache-dir -r requirements.txt

# Command to train the model during the build phase
RUN python train.py

# Command to execute when the container starts
CMD ["python", "test.py"]
