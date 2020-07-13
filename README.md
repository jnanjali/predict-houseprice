[![CircleCI](https://circleci.com/gh/jnanjali/predict-houseprice.svg?style=svg)](https://circleci.com/gh/jnanjali/predict-houseprice)

## Project Overview

In this project, I have applied the skills that I  have acquired in this course to operationalize a Machine Learning Microservice API. 

A pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home is available. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

The follwing tasks has been executed to achieve this.

The project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested


** The final implementation of the project will showcase your abilities to operationalize production microservices.**

---
2. Steps on how to run the Python scripts and webapp

a). ## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

python3 -m venv ~/.devops
source ~/.devops/bin/activate
make install

* Run Lint Checks
brew install hadolint

* Complete a Dockerfile to containerize this application
## Step 1:
# Create a working directory
WORKDIR /code

## Step 2:
### Copy source code to working directory

COPY app.py /code
COPY model_data/* /code/model_data/

## Step 3:
### Install packages from requirements.txt
### hadolint ignore=DL3013

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt



## Step 4:
### Expose port 80

EXPOSE 80


## Step 5:

### Running `app.py` at Launch

CMD ["python",  "/code/app.py"]

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`

## Complete the following steps to get Docker running locally

### Step 1:
- Build image and add a descriptive tag

docker build -t houseprice:1.0 .

### Step 2: 
- List docker images

docker images

### Step 3: 

- Run flask app
docker run -p  8000:80 houseprice:1.0

3. Run in Kubernetes:  `./run_kubernetes.sh`
### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl

### Step 1:

- This is your Docker ID/path
dockerpath=anjalicurie/kubetest:1.0

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run kubehouse  --image=anjalicurie/kubetest:1.0 

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward deployments/kubehouse 8000:80 

STEP 3: A description of the files used

- DOCKERFIle: File used to build docker image for app.py
- Kubernetes_out.txt: Output of running app.py on kubernetes
- requirements.txt: python dependencies to install in the container
- MAKEFILE: set up of the initial environment and run Linter
- make_prediction.sh:API call to prediction service app.py to make predictions
- run_docker.sh:build Docker image, tag and run prediction service app.py in docker
- model_data: it contains the training data for prediction service
- run_kuberenetes.sh:run app.py as container on kubernetes
- app.py: python code for prediction service
- upload_docker.sh: uploading the docker container image to docker hub
- docker-out.txt:output of running the docker container using docker for desktop


