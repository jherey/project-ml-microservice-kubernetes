## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	# Create python virtualenv & source it
	python3 -m venv ~/.devops
	. ~/.devops/bin/activate

install:
	# This should be run from inside a virtualenv
	pip install --no-cache-dir --upgrade pip && \
		pip install --no-cache-dir --upgrade setuptools && \
		pip install --no-cache-dir --upgrade wheel && \
		pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt
	# pip install --upgrade pip &&\
	# 	pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app.py

all: install lint test
