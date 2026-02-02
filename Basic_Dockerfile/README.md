# Hello Captain – Docker Basics Project

## URL Project: https://roadmap.sh/projects/basic-dockerfile

## Project Overview

This project is a simple introduction to **Docker** and containerization.

The goal is to create a minimal Docker image that prints:

```
Hello, Captain!
```

to the console when the container is run, then exits.

This project focuses on understanding:

* What a Dockerfile is
* How Docker images are built
* How containers run commands
* How to use a minimal base image

---

## Project Requirements

This project satisfies the following requirements:

* The Dockerfile is named `Dockerfile`
* The Dockerfile is located in the root directory
* The base image used is `alpine:latest`
* The Dockerfile contains a **single instruction** to print the message
* The container prints `Hello, Captain!` and exits

---

## Project Structure

```text
Basic_Dockerfile/
├── Dockerfile
└── README.md
```

---

## Dockerfile Content

```Dockerfile
FROM alpine:latest
CMD ["echo", "Hello, Captain!"]
```

---

## How to Build the Docker Image

From the root directory of the project:

```bash
docker build -t hello-captain .
```

---

## How to Run the Docker Container

```bash
docker run hello-captain
```

Expected output:

```text
Hello, Captain!
```

---

## Explanation

* `FROM alpine:latest`
  Uses Alpine Linux, a lightweight Linux distribution (~5MB), ideal for simple containers.

* `CMD ["echo", "Hello, Captain!"]`
  Defines the default command executed when the container starts.
  It runs `echo` and prints the message before exiting.

The container performs its task and stops immediately after execution.

---

## Stretch Goal (Optional Enhancement)

You can make the image more dynamic by allowing a name to be passed as an argument:

```bash
docker run hello-captain Axel
```

Output:

```text
Hello, Axel!
```

This can be achieved using `ENTRYPOINT` and arguments in the Dockerfile.

---

## Skills Demonstrated

* Docker fundamentals
* Writing a Dockerfile
* Building Docker images
* Running Docker containers
* Understanding base images and commands

---

## Author

Created by **Axel AHO** as a beginner-friendly Docker learning project.
