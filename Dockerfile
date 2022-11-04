FROM docker:git

LABEL maintainer="William Bridge <ngaswilly77@gmail.com>"

# Install sshd and openjdk11 packages
RUN apk add openssh-server openjdk11

# Add jenkins user to the image
RUN adduser -D jenkins

# Set password for the jenkins user
RUN echo "jenkins:jenkins" | chpasswd

# Generate host keys
RUN ssh-keygen -A

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]