# Docker Java Test

A simple Java "Hello, World!" application packaged as a fat JAR and containerized with Docker.

## Project Structure

```
docker-java-test/
├── pom.xml
├── src
│   └── main
│       └── java
│           └── com
│               └── example
│                   └── App.java
└── Dockerfile
```

## Prerequisites

- Docker Desktop installed on your machine
- (Optional) JDK 17+ and Maven (if you want to build locally without Docker)

## Build & Run Locally (without Docker)

1. Compile and package:
   ```bash
   mvn clean package
   ```
2. Run the JAR:
   ```bash
   java -jar target/docker-java-test-1.0-SNAPSHOT.jar [YourName]
   ```
   - If you omit `[YourName]`, it defaults to `World`.

## Docker

All build and runtime steps can be performed inside containers—no local Java or Maven installation required.

### Build Docker Image

From the project root:

```bash
docker build -t docker-java-test .
```

- `-t docker-java-test` tags the image for easy reference.

### Run Docker Container

```bash
# Default greeting:
 docker run --rm docker-java-test
# Custom greeting:
 docker run --rm docker-java-test Alice
```

- `--rm` automatically removes the container after it exits.
- Passing `Alice` (or any argument) gets forwarded to your Java app.

### Customizing Default Name

If you want to change the built-in default (when no argument is given), you can update the Dockerfile:

```dockerfile
ENTRYPOINT ["java", "-jar", "app.jar"]
CMD ["Alice"]
```

Rebuild the image to apply the new default.

## Cleaning Up

To remove dangling images and stopped containers:

```bash
docker system prune
```  