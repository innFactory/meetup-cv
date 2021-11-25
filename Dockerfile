FROM --platform=linux/amd64 ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y python3 python3-pip python3-pil ffmpeg libsm6 libxext6

RUN pip3 install jupyter jupyterlab numpy opencv-python matplotlib

RUN useradd -ms /bin/bash meetup
USER meetup
WORKDIR /home/meetup

COPY --chown=meetup ./notebook.ipynb /home/meetup
COPY --chown=meetup ./notebook_images/* /home/meetup

EXPOSE 8888

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]
