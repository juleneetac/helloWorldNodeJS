#FROM docker-registry.default.svc:5000/localdemo/nodejs-14:latest
#FROM 172.30.1.1:5000/localdemo/hello:latest
FROM registry.access.redhat.com/openshift3/ose-docker-builder:v3.11
# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access
USER 0
ADD package.json /tmp/src/package.json
ADD index.js /tmp/src/index.js

ADD views/index.html /tmp/src/views/index.html


RUN chown -R 1001:0 /tmp/src
RUN chown -R 1001:0 /tmp/src/views
USER 1001

# Install the dependencies
RUN /usr/libexec/s2i/assemble
EXPOSE 8080
# Set the default command for the resulting image
CMD /usr/libexec/s2i/run