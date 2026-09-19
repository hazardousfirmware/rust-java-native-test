FROM debian:trixie

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        cargo \
        default-jdk \
        pkg-config \
        rustc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# toml file is the dependencies of the rust app
COPY Cargo.toml .
COPY src ./src

# Build the Rust JNI shared library.
RUN cargo build --release

# Compile Java from src/ and generate JNI headers.
RUN mkdir -p build/classes build/headers \
    && javac \
        -h build/headers \
        -d build/classes \
        src/NativeLibrary.java

# Package the Java class as an executable JAR.
RUN jar --create \
        --file mylibrary.jar \
        --main-class NativeLibrary \
        -C build/classes NativeLibrary.class

CMD ["java", "-Djava.library.path=/app/target/release", "-jar", "/app/mylibrary.jar", "100", "200"]
