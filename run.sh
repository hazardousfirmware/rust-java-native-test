#!/bin/bash
set -eu

IMAGE_NAME="rust-java-native-test"

echo "Running Docker image: ${IMAGE_NAME}"
docker run --rm "${IMAGE_NAME}"
