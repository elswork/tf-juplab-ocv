# OpenCV + JupyterLab + Tensorflow

A [Docker](http://docker.com) image for AMD & ARM devices with [Tensorflow](https://www.tensorflow.org/) an open source software library for numerical computation using data flow graphs that will let you play and learn distinct Machine Learning techniques and with [JupyterLab](https://github.com/jupyterlab/jupyterlab) an open-source web application that allows you to create and share documents that contain live code, equations, visualizations and explanatory text. Computational Narratives as the Engine of Collaborative Data Science. All this under Python3 language. [OpenCV](https://opencv.org/)is a library of programming functions mainly aimed at real-time computer vision.

> Be aware! You should read carefully the usage documentation of every tool!

## Details

- [GitHub](https://github.com/DeftWork/tf-juplab-ocv)
- [Docker Hub](https://hub.docker.com/r/elswork/tf-juplab-ocv/)
- [Deft.Work my personal blog](http://deft.work/tensorflow_for_raspberry)

## Build Instructions

Build for amd64

```sh
docker build -t elswork/tf-juplab-ocv:latest .
```

Build for arm32v7

```sh
docker build --no-cache -t elswork/tf-juplab-ocv:latest .
```

## My Real Usage Example

In order everyone could take full advantages of the usage of this docker container, I'll describe my own real usage setup.

Run for amd64 or arm32v7 architecture (thanks to [Multi-Arch](https://blog.docker.com/2017/11/multi-arch-all-the-things/))

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