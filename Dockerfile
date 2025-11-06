###Dockerfile

>A Dockerfile is a text file that contains a set of instructions to build a Docker image. Think of it like a recipe for creating a Docker container.
>The Docker image is like a blueprint that contains everything needed to run a piece of software — including the code, libraries, environment variables, and tools.

>Once the Docker image is built from the Dockerfile, you can use it to create a container. A container is a running instance of that image.
>So, you can think of an image as a blueprint, and a container as a running instance of that blueprint.

###Simple and Easy Explanation:

>Docker Image: It's the final product you get after building a Dockerfile. It's a snapshot of your environment (your application and all the required dependencies).
>Docker Container: It's the running instance of that image. You can have multiple containers running from the same image.


###Real-Time Analogy:

>Dockerfile is like a recipe in a cookbook.
>Docker Image is the prepared dish (after you follow the recipe).
>Docker Container is the served dish that you're eating right now.

###Key Concepts of a Dockerfile:

#FROM : Specifies the base image to start from.
    eg: FROM ubuntu:20.04 means you're starting with an Ubuntu 20.04 image.

#RUN : Executes commands to install software or make changes to the image.
    Example: RUN apt-get update && apt-get install -y curl installs curl inside the image.

#COPY or ADD: Copy files or directories into the image.
     Example: COPY . /app copies the current directory to the /app directory in the image.

#WORKDIR : Set the working directory inside the container.
     Example: WORKDIR /app makes /app the default directory for future commands.

#CMD: Specifies the command that should be run when a container is started.
     Example: CMD ["python", "app.py"] runs a Python app when the container starts.

==========================================================================================================================================================================================================================
#########Real-World Use Case:

Imagine you're deploying a Python web app. Without Docker, you would have to manually install Python, libraries, and set up your environment on any machine you want to run your app. With Docker, you can write a Dockerfile that defines everything, including the operating system, Python version, required libraries, and the app itself.

# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside the container
EXPOSE 5000

# Define the command to run your app
CMD ["python", "app.py"]

======================================================================================================================================================================================================================

########### How It Works:

FROM python:3.9-slim – It starts with a Python 3.9 image.
WORKDIR /app – It sets /app as the directory where your app will run.
COPY . /app – It copies all files from your local directory into the /app directory in the image.
RUN pip install – It installs the required Python packages (which are listed in requirements.txt).
EXPOSE 5000 – It tells Docker that the app will be accessible on port 5000.
CMD ["python", "app.py"] – It defines the command to run when the container starts.

#Building the Docker Image:

To build the image from the Dockerfile, you'd run this command:
#docker build -t my-python-app .

>>> -t my-python-app gives the image a name.
>>> . specifies the build context (the current directory).
===================
#Running the Docker Container:

Once the image is built, you can run it as a container:
#docker run -p 5000:5000 my-python-app

>>>> -p 5000:5000 maps port 5000 on your local machine to port 5000 in the container (where your app is running).
>>>>  my-python-app is the name of the image you just built.

>>>>>>>>>>>>>>>>>>>>>>>>Now, your Python app is running inside a container and is accessible from your local machine via http://localhost:5000.
==============================================================================================================================================================================================================================

### JENKINS

#Create a Dockerfile : Create a new directory to store your Dockerfile and Jenkins configuration:
mkdir jenkins-docker
cd jenkins-docker
>>>>>>>>>>>>>>>>>>>>>>>>Now, create a new file called Dockerfile:
touch Dockerfile
>>>>>>>>>>>>Edit the Dockerfile using your favorite editor:
vi Dockerfile

# Use the official Jenkins LTS image as the base image
FROM jenkins/jenkins:lts

# Install additional dependencies if needed (e.g., curl, git)
USER root
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Expose Jenkins port (default is 8080)
EXPOSE 8080

# Set the default entrypoint to start Jenkins
ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]

This Dockerfile starts with the official Jenkins LTS image and adds some useful dependencies like curl and git (you can add more as needed).

#Build the Docker Image ###docker build -t my-jenkins .
>>> -t my-jenkins specifies the name of the image.
>>> . refers to the current directory, which contains the Dockerfile.

#Run the Jenkins Docker Container
Once the image is built, you can run it with the following command: ###docker run -d --name jenkins -p 8080:8080 my-jenkins

-d: Runs the container in detached mode (in the background).
--name jenkins: Names the container jenkins.
-p 8080:8080: Maps port 8080 of your EC2 instance (or localhost) to port 8080 in the container (Jenkins runs on port 8080 by default).
my-jenkins: The name of your custom Docker image.
This command starts the Jenkins container in the background.

#Access Jenkins in Your Browser
http://<your-ec2-public-ip>:8080
====================================================================================================================================================================================================================================
