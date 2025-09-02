# From is an instruction allowing to set a base image for subsequent instructions. 
FROM alpine
# RUN is an instruction allowing to execute any commands in a new layer on top of the current image and commit the results.
RUN apk add --update nodejs
# COPY is an instruction allowing to copy files and directories from source and add them to the filesystem of the container at the path destination.
COPY ./app.js /app/
# CMD is an instruction allowing to provide defaults for an executing container.
CMD ["node", "/app/app.js"]
