PROJECT=python-examples
PACKAGE_NAME=example-python-package
PACKAGE_VERSION=$(shell cat VERSION)
PACKAGE_CONFIG_TYPE=yaml
USER_INSTALL_DIRECTORY=$(shell echo ${HOME})
TEST_NUM=50
DOCKER_TEST_NUM=$(shell echo {1..${TEST_NUM}})

build:
	python setup.py sdist

install:
	make build
	pip install dist/${PACKAGE_NAME}-${PACKAGE_VERSION}.tar.gz

uninstall:
	pip uninstall -y dist/${PACKAGE_NAME}-${PACKAGE_VERSION}.tar.gz

reinstall:
	make uninstall
	make install

userbuild:
	pip install --user -r requirements.txt
	make build

userinstall:
	make userbuild
	pip install --user dist/${PACKAGE_NAME}-${PACKAGE_VERSION}.tar.gz

docker:
	docker build --build-arg PACKAGE_NAME=${PACKAGE_NAME} --build-arg PACKAGE_VERSION=${PACKAGE_VERSION} -t ${PROJECT}/${PACKAGE_NAME}:${PACKAGE_VERSION} .
	docker build --build-arg PACKAGE_NAME=${PACKAGE_NAME} --build-arg PACKAGE_VERSION=${PACKAGE_VERSION} -t ${PROJECT}/${PACKAGE_NAME}:latest .

clean:
	rm -rf *.egg-info dist

dockerrun:
	docker run -it ${PROJECT}/${PACKAGE_NAME}:${PACKAGE_VERSION} sh

dockermakerun:
	make docker
	make dockerrun

dockertest:
	docker run -it ${PROJECT}/${PACKAGE_NAME} sh -c "for i in ${DOCKER_TEST_NUM} ; do guassian-number -m 50 -s 10 ; done"

dockersuite:
	make docker
	make dockertest
