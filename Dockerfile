FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /code

## Step 2:
# Copy source code to working directory
COPY app.py /code
COPY model_data/* /code/model_data/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt



## Step 4:
# Expose port 80
EXPOSE 80


## Step 5:
# Run app.py at container launch
CMD ["python",  "/code/app.py"]
