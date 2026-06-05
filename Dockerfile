FROM jenkins/jenkins:lts

USER root

# Install Java, Maven, Git, Docker CLI
RUN apt-get update && \
    apt-get install -y \
    openjdk-21-jdk \
    maven \
    git \
    docker.io \
    curl \
    ca-certificates

# Install Node.js 22
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs

# Install Angular CLI
RUN npm install -g @angular/cli

# Verify installations
RUN java -version && \
    mvn -version && \
    node -v && \
    npm -v && \
    ng version

USER jenkins
