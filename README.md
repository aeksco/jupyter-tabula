# jupyter-tabula
Docker container image built with [Jupyter Notebook](http://jupyter.org/) and [Tabula](https://tabula.technology/) for PDF scraping. Includes an example notebook to help you get started.

Repository hosted on GitHub at [aeksco/jupyter-tabula](https://github.com/aeksco/jupyter-tabula).

Docker container image hosted on Docker Hub at [aeksco/jupyter-tabula](https://hub.docker.com/r/aeksco/jupyter-tabula/).

## Usage

#### Running the Jupyter Notebook server
```
docker run -it -p 8888:8888 aeksco/jupyter-tabula
```

#### Example Notebook
The `Example_01.ipynb` opens a single-page PDF and parses the table contained within.


## Building the Docker Image

Use the following instructions if you want to modify this Docker image and push a different copy to DockerHub.

1. Create a [new Dockerhub Repository](https://hub.docker.com/add/repository/) named `jupyter-tabula`.

2. Build the Docker image by running the following command in the `jupyter-tabula` directory:

```
docker build -t jupyter-tabula .
```

3. Test the image locally with the following command:

```
docker run -it --rm --pid=host -p 8888:8888 jupyter-tabula
```

4. Tag the image and push to Dockerhub:

```
docker tag bb38976d03cf your_docker_hub_username/jupyter-tabula:latest
docker push your_docker_hub_username/jupyter-tabula
```

## Notes

I would recommend this container image for testing and hacking purposes. This image is a bit heavy (`2.02GB`) since it extends the [tensorflow/tensorflow](https://hub.docker.com/r/tensorflow/tensorflow/) container image. This was done mainly to save time since the Tensorflow container already has all the relevant dependencies installed and configured.