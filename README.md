# Inception

## I. Preamble

## II. Introduction

This project is a System Administration exercise focused on system virtualization using Docker. The objective is to create and configure Docker images within a personal virtual machine.

## III. General Guidelines

- This project is to be completed on a Virtual Machine.
- Place all configuration files in a 'srcs' folder.
- Include a Makefile at the root of the directory to set up the entire application using docker-compose.yml.
- Refer to Docker documentation to reinforce understanding.

## IV. Mandatory Part

This project involves setting up a small infrastructure with different services in a virtual machine using Docker Compose. Specific rules apply:

1. Each Docker image must share the same name as its corresponding service.
2. Each service runs in a dedicated container.
3. Containers must be built from the penultimate stable version of Alpine or Debian.
4. Write Dockerfiles for each service and call them in docker-compose.yml via the Makefile.
5. Set up NGINX with TLSv1.2 or TLSv1.3, WordPress + php-fpm, MariaDB, and related volumes and network.
6. Containers must restart in case of a crash.
7. Follow best practices for Dockerfiles and PID 1.
8. Configure a domain name (login.42.fr) to point to your local IP address.
9. Prohibit the use of network: host or --link in docker-compose.yml.
10. WordPress database must have two users, one being the administrator.
11. Volumes must be available in /home/login/data on the host machine.
12. NGINX must be the entrypoint via port 443 with TLSv1.2 or TLSv1.3.

## V. Bonus Part

- Redis cache for WordPress.
- FTP server container for WordPress volume.
- Create a static website (excluding PHP).
- Set up Adminer.
- Introduce a service of your choice, justifying its relevance.

## VI. What I Learned

Throughout this project, I gained valuable knowledge and skills in the following areas:

- **Docker Usage:** Developed a solid understanding of Docker, including creating custom Docker images and configuring containers.

- **Infrastructure Setup:** Learned to set up a virtualized infrastructure, managing multiple services with Docker Compose.

- **Network Configuration:** Understood the intricacies of networking in a virtual environment, including container communication and network restrictions.

- **Security Best Practices:** Applied security measures, such as TLS configurations and user management, to enhance the project's robustness.

- **System Administration:** Gained hands-on experience in system administration tasks, including daemon processes, container restart policies, and volume management.

- **Domain Configuration:** Configured domain names and associated them with local IP addresses, demonstrating DNS-related skills.

- **Troubleshooting:** Developed problem-solving skills by identifying and resolving issues within the Dockerized environment.

This project significantly expanded my knowledge base and practical skills in system administration and Docker, paving the way for more complex infrastructure projects in the future.
