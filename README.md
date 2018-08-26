# OpenCV + JupyterLab + Tensorflow

A [Docker](http://docker.com) file to build images for AMD & ARM devices over a base image based with a minimal installation of [Tensorflow](https://www.tensorflow.org/) an open source software library for numerical computation using data flow graphs. 
Also included in base image [OpenCV](https://opencv.org/)is a library of programming functions mainly aimed at real-time computer vision. 
Over this base will be installed [JupyterLab](https://github.com/jupyterlab/jupyterlab) an open-source web application that allows you to create and share documents that contain live code, equations, visualizations and explanatory text. Computational Narratives as the Engine of Collaborative Data Science. All this under Python3 language.

> Be aware! You should read carefully the usage documentation of every tool!

## Details

- [GitHub](https://github.com/DeftWork/tf-juplab-ocv)
- [Deft.Work my personal blog](http://deft.work/tensorflow_for_raspberry)

| Docker Hub | Docker Pulls | Docker Stars | Docker Build | Size/Layers |
| --- | --- | --- | --- | --- |
| [tf-juplab-ocv](https://hub.docker.com/r/elswork/tf-juplab-ocv "elswork/tf-juplab-ocv on Docker Hub") | [![](https://img.shields.io/docker/pulls/elswork/tf-juplab-ocv.svg)](https://hub.docker.com/r/elswork/tf-juplab-ocv "tf-juplab-ocv on Docker Hub") | [![](https://img.shields.io/docker/stars/elswork/tf-juplab-ocv.svg)](https://hub.docker.com/r/elswork/tf-juplab-ocv "tf-juplab-ocv on Docker Hub") | [![](https://img.shields.io/docker/build/elswork/tf-juplab-ocv.svg)](https://hub.docker.com/r/elswork/tf-juplab-ocv "tf-juplab-ocv on Docker Hub") | [![](https://images.microbadger.com/badges/image/elswork/tf-juplab-ocv.svg)](https://microbadger.com/images/elswork/tf-juplab-ocv "tf-juplab-ocv on microbadger.com") |

## Build Instructions

Build for amd64 or arm32v7 architecture (thanks to its [Multi-Arch](https://blog.docker.com/2017/11/multi-arch-all-the-things/) base image)

```sh
docker build -t elswork/tf-juplab-ocv:latest .
```

## My Real Usage Example

In order everyone could take full advantages of the usage of this docker container, I'll describe my own real usage setup.

```sh
docker run -d -p 8888:8888 elswork/tf-juplab-ocv:latest
```

A more complex sample:

```sh
docker run -d -p 8888:8888 -p 0.0.0.0:6006:6006 \
 --restart=unless-stopped elswork/tf-juplab-ocv:latest
```

If you want to add access to USB Cam attached to host (--device=/dev/video0).

```sh
docker run -d -p 8888:8888 -p 0.0.0.0:6006:6006 --device=/dev/video0  \
 --restart=unless-stopped elswork/tf-juplab-ocv:latest
```

Point your browser to `http://localhost:8888`

First time you open it, you should provide a Token to log on you cand find it with this command:

```sh
docker logs container_name
```

With the second example you can run TensorBoard executing this command in the container:

```sh
tensorboard --logdir=path/to/log-directory --host=0.0.0.0
```

And pointing your browser to `http://localhost:6006`