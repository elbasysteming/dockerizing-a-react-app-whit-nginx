# Steps to dockerize a React application

#### 1.- Build the Docker image for the current folder  and tag it with dockerized-react

### `docker build . -t dockerized-react`

#### 2.- Check the image was created

### `docker images`

#### 3.- Notice we're now mapping port 80 inside the container to port 3000 on the host machine

### `docker run -p 3000:80 -d dockerized-react`

#### 4.- Check the image was created

### `docker images`
