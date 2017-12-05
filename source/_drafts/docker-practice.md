---
title: docker-practice
tags:
---

https://github.com/yeasy/docker_practice/blob/master/SUMMARY.md


# Get Started, Part 1: Orientation and setup



Welcome! We are excited you want to learn how to use Docker.

In this six-part tutorial, you will:

1. Get set up and oriented, on this page.
2. Build and run your first app
3. Turn your app into a scaling service
4. Span your service across multiple machines
5. Add a visitor counter that persists data
6. Deploy your swarm to production

The application itself is very simple so that you are not too distracted by what the code is doing. After all, the value of Docker is in how it can build, ship, and run applications; it’s totally agnostic as to what your application actually does.


## Prerequisites

While we’ll define concepts along the way, it is good for you to understand what Docker is and why you would use Docker before we begin.

We also need to assume you are familiar with a few concepts before we continue:

IP Addresses and Ports
Virtual Machines
Editing configuration files
Basic familiarity with the ideas of code dependencies and building
Machine resource usage terms, like CPU percentages, RAM use in bytes, etc.


## A brief explanation of containers

An image is a lightweight, stand-alone, executable package that includes everything needed to run a piece of software, including the code, a runtime, libraries, environment variables, and config files.

A container is a runtime instance of an image—what the image becomes in memory when actually executed. It runs completely isolated from the host environment by default, only accessing host files and ports if configured to do so.

Containers run apps natively on the host machine’s kernel. They have better performance characteristics than virtual machines that only get virtual access to host resources through a hypervisor. Containers can get native access, each one running in a discrete process, taking no more memory than any other executable.


## Containers vs. virtual machines

Consider this diagram comparing virtual machines to containers:

Virtual Machine diagram:

![](https://www.docker.com/sites/default/files/VM%402x.png)

Virtual machines run guest operating systems—note the OS layer in each box. This is resource intensive, and the resulting disk image and application state is an entanglement of OS settings, system-installed dependencies, OS security patches, and other easy-to-lose, hard-to-replicate ephemera.

Container diagram

![](https://www.docker.com/sites/default/files/Container%402x.png)

Containers can share a single kernel, and the only information that needs to be in a container image is the executable and its package dependencies, which never need to be installed on the host system. These processes run like native processes, and you can manage them individually by running commands like docker ps—just like you would run ps on Linux to see active processes. Finally, because they contain all their dependencies, there is no configuration entanglement; a containerized app “runs anywhere.”