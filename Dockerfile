FROM python:3.7-alpine

ARG PACKAGE_NAME="example-python-package"
ARG PACKAGE_VERSION="latest"

LABEL version="${PACKAGE_VERSION}"
LABEL maintainer="Jordan Garrison <jordan.garrison@flosports.tv>"

RUN mkdir -p /app
ADD . /app/${PACKAGE_NAME}
WORKDIR /app/${PACKAGE_NAME}
COPY assets/${PACKAGE_NAME}.conf /etc/${PACKAGE_NAME}.conf

RUN pip install -r requirements.txt
RUN python setup.py sdist
RUN pip install dist/${PACKAGE_NAME}-${PACKAGE_VERSION}.tar.gz

WORKDIR /root

RUN rm -rf /app/${PACKAGE_NAME}
