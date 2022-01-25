# Spring Boot API with GitHub Actions and Okteto 

This is an application providing Course management via REST calls.

## Prerequisites

Perform the following actions if you want to run the app in your own CI/CD context.

1. Fork this repository

### CI pipeline

2. [DockerHub](https://hub.docker.com/)
   - Create a DockerHub account (or log in if you have one)
   - Generate a DockerHub Token (My Account -> Security)
   - Define a GitHub SONAR_TOKEN Secret with the generated token (Settings -> Secrets)
3. [Sonarcloud](https://sonarcloud.io)
   - Create a Sonarcloud account (or log in if you have one)
   - Generate a Sonarcloud Token (Account Settings -> Security)
   - Define a GitHub DOCKERHUB_USERNAME Secret with your DockerHub usename
   - Define a GitHub DOCKERHUB_TOKEN Secret with the generated token (Settings -> Secrets)
4. [Snyk](https://app.snyk.io)
   - Create a Snyk account (or log in if you have one)
   - go to your [Snyk](https://app.snyk.io/account) account’s settings page and retrieve the API token.
   - Define a GitHub SNYK_TOKEN Secret with the generated token (Settings -> Secrets)


### CD pipeline


## CI/CD Pipeline with GitHub Actions

!(CI/CD diagram)[ci-cd.png]





