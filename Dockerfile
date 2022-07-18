FROM python:latest
RUN pip install --upgrade pip
WORKDIR /python-docker
CMD [ "python", "-m", "flask", "run", "--host=0.0.0.0"]

#Update apt packages
RUN apt update
RUN apt upgrade -y

#Install vim
RUN apt install vim -y

RUN apt install net-tools -y
RUN apt-get -y update && apt-get -y install nginx

#Expose the port for access
EXPOSE 80/tcp

#Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
RUN apt-get update && apt-get install wget -y

