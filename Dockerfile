FROM elswork/tensorflow-diy:latest

LABEL mantainer="Eloy Lopez <elswork@gmail.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
    libzmq3-dev \
    python-tk \
    python3-matplotlib \
    libxml2-dev libxslt-dev \
    libjpeg62 libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libxvidcore-dev libx264-dev \
    qt4-dev-tools python3-pil && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG OCV_FILE=opencv-python

RUN pip3 --no-cache-dir install \
    lxml cython $OCV_FILE \
    ipykernel jupyterlab \
    #sklearn \
    #pandas \
    && \
    python3 -m ipykernel.kernelspec

# Copy sample notebooks.
COPY notebooks /notebooks

# TensorBoard & Jupyter
EXPOSE 6006 8888

WORKDIR "/notebooks"

CMD jupyter lab --ip=* --no-browser --allow-root