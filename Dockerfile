FROM ubuntu

RUN /bin/bash

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
  && rm -rf /var/lib/apt/lists/*

RUN curl -qsSLkO \
    https://repo.continuum.io/miniconda/Miniconda-latest-Linux-`uname -p`.sh \
  && bash Miniconda-latest-Linux-`uname -p`.sh -b \
  && rm Miniconda-latest-Linux-`uname -p`.sh

ENV PATH=/root/miniconda2/bin:$PATH

RUN conda create --name keras python=3

RUN source activate keras

RUN conda install -y \
    h5py \
    pandas \
    hyperopt \
    pykalman \
    quandl

RUN pip install --no-deps git+git://github.com/Theano/Theano.git \
  && pip install keras
