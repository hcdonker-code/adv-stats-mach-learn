# Solution
FROM ubuntu:25.10
# Set environment variable to prevent user input by switching to noninteractive mode.
ARG DEBIAN_FRONTEND=noninteractive

# Install the pip command.
RUN apt update \
  && apt install --yes --no-install-recommends \
    python3-pip=25.1.1+dfsg-1ubuntu2 \
    curl=8.14.1-2ubuntu1

RUN python3 -m pip install \
  --no-cache-dir \
  --break-system-packages \
  google-cloud-storage==3.4.1 \
  pandas[gcp]==2.3.3 \
  scikit-learn==1.5.2

COPY src/ /app/
WORKDIR /app/

ENTRYPOINT ["python3", "trainer.py"]
