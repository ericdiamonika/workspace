FROM ubuntu:latest

MAINTAINER Eric Diamonika 

WORKDIR /workspace

RUN apt-get update -y && apt-get dist-upgrade -y && \
    apt-get install python3 -y && \
    apt-get install python3-pip -y && \
    pip3 install virtualenv && \
    apt-get install git -y
RUN git config --global user.name "John Doe" && \
    git config --global user.email johndoe@example.com && \
    git config --global user.password "password"

RUN mkdir workspace
COPY requirements.txt /workspace

RUN virtualenv -p python3 venv

CMD sh -c 'source venv/bin/activate;'   
RUN pip3 install -r requirements.txt

EXPOSE 8888

CMD ["sh", "-c" , "jupyter notebook --no-browser --port=8888 --ip='0.0.0.0' --allow-root"]
