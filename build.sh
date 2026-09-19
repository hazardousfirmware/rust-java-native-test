#!/bin/bash
set -eu

IMAGE_NAME="rust-java-native-test"

echo "Building Docker image: ${IMAGE_NAME}"
docker build -t "${IMAGE_NAME}" .
