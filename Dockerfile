FROM docker-registry.default.svc:5000/application-delivery/nodejs-14:latest
# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access
USER 0
ADD package.json /tmp/src/package.json
ADD server.js /tmp/src/server.js

ADD views/index.html /tmp/src/views/index.html



RUN chown -R 1001:0 /tmp/src
RUN chown -R 1001:0 /tmp/src/views
USER 1001

# Install the dependencies
RUN /usr/libexec/s2i/assemble
EXPOSE 8080
# Set the default command for the resulting image
CMD /usr/libexec/s2i/run