# Docker Exercise
This eximent goes throug setting up and getting slightly familiar with docker and docker-compose by doing a short exercise. 

## What is Docker?
Docker is a tool that uses containers to make it easier to create, deploy and run applications. The containers are used by the developers to package up the applications with all of the parts it needs, that is libraries and other dependencies, and ship it in one package. The application can then by run on any other Linux machine, regardless of any customized settings on that machine, using the container.

## What is the difference between:
* Virtual Machine
* Docker Container
* Docker Image
A Container is a running instance of an Image. You can for instance have many Containers running initiated from the same Image. A Container differs from an Virtual Machine in the sence that a Virtual Machine has an operating system, a container however runs in the same operating system as the host, but is sandboxed from the host machine, in the sence that libraries and configurations from the host machine do not affect the running container, since the container store all libraries and configurations from the machine where the Image was made. 

## What is docker-compose:
Docker-compose is a tool that can run many Docker containers simutaniously, that allows the developer to run multi-container Docker applications.

## Results
In the exercise both Docker and docker-compose were installed and a Docker Image created, run, and stored in the Docker Cloud. Then a multi-container Docker application was run with docker-compose. 