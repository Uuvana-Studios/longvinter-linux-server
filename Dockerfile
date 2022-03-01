FROM ubuntu:20.04 
# I want to use Alpine Linux for my Dockerfile but this will do for now. Getting a practical concept is priority.
LABEL maintainer="Uuvana-Studios"
COPY . .
# Possible security risk with *.sh files. Will check on this later.
RUN chmod +x *.sh && ./LongvinterSetup.sh
ENTRYPOINT ["~/longvinter-linux-server/LongvinterServer.sh"] 