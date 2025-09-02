# Docker_Course

## What's a VM ?
Vm is a virtual machine built by a software but doesn't really exist.
It enables to simulate hardware materials like CPU/ GPU, graphical card, etc.
It's also useful for used different OS without restart: It's perfect for dev for example.
But drawback is decline in performance because resource allocation must be divided.


## Difference with Docker ? 
 Docker use Linux and GNU environment of our OS. If we are on MACOS or Windows, it use hypervisor already install on our OS and will launch a virtual machine that it will use.
On our Os, it launch a containeur who is a process with encapsulation feature that able it to be isolated from host and other containeurs. 
Each containeur has own files system provided by a docker image. This file system contains the code, binaries , execuatable files and all require dependancies to run an application.
Docker share OS between all launched containers that they are simple light process.
Whereas VM is a full OS needed a lot of RAM, plenty of hard drive space.

## Technologies used by Docker?

### Namespaces 

Docker use the Linux namespaces that allow to create isolated space on Linus OS.
It's this feature that give containers their insulation.

### Cgroups


## Docker ecosystem 

### Docker daemon (dockerd)

It's a process who run in background of our OS, it's the heart of Docker. 

### API REST and Client (CLI)
For used it, we will use an API named Docker Server, we will use a tool who simplify API usage thanks Docker CLI ( command line interface ).


The whole of docker Server and Docker CLI is named Docker client and the whole Docker client and Docker Daemon named Docker Engine. 


### Images
 Docker image is an schema read only who contains different instruction to create a docker container 
Most frequently, a docker image is build on an other image with different configurations.
Example, it's possible to take an image Node.Js and add necessary files for run our application.
Each instruction into a dockerfile allow to create a layer into the image.
When you edit the dockefile and you rebuild image, only the layers edit are re-build. It's one of the reason for what docker is faster that VM.

### Containers

A container is an instance of image in progress who take configurations options launch during the run.
Its the same logic that process that we can lauch many time in the same time thus creatins several process.
For CREATE, START, STOP, MOVE or DELETE a container we need to use the CLI.

### Volumes

Volumes allow containers to store data.
They are init during the creation of a container, they allow to persist and share data of container.
This volumes are store outside of UnionFS , they allow to persist data even if a container is delete, patch or reload.


## First Container 

### Launch my first container 

```
docker run hello-world
```

This is our first command with docker CLI ! Thanks this command, the client docker ask to daemon to execute a new container from specific image.

- Docker start by verify if whe have the image locally
- Docker pull an image from hub into our OS
- Docker tell us that the download is done 
- it provide the id of the image 
- Docker create a container from the downloaded image 
- Docker daemon execute a specifical command into the configuration file (dockerfile)

### Re-Launch the container 

After relaunch the container, you can see that docker doesn't download an images because we have already the image into our OS.

## Differennt step of images build

### Dockerfile format

```
# Commentaire
INSTRUCTION arguments
```
You can therefore write comments by preceding them with a #.

All instructions, which we will study one by one in the following lessons, are in capital letters.


### How image building works

We will now go into detail about image building.

When the Docker daemon executes each instruction, it creates a layer and saves it in a new image if necessary.

As a reminder, a Docker image is a stack of read-only layers that represent the instructions in the Dockerfile.

Exemple: 
```
FROM alpine
RUN apk add --update nodejs
COPY ./app.js /app/
CMD [ "node", "/app/app.js" ]

```
### How caches works

Whenever possible, Docker will reuse cached intermediate images to speed up (often significantly) the build process.

When Docker uses the cache during a build step, you will see the message “Using cache” and the step will be completed instantly.










































