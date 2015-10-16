export VERSION=v0.44

echo "Building carbon-c-relay from revision $VERSION"
docker run --rm \
  -v /tmp:/export \
  gliderlabs/alpine \
  /bin/sh -c " \
    apk --update add build-base git && \
    git clone https://github.com/grobian/carbon-c-relay.git && \
    cd carbon-c-relay && \
    git checkout $VERSION && \
    make && 
    cp relay /export"

mv /tmp/relay . 

echo "docker build --tag=carbon-c-relay:$VERSION ."
docker build --tag=carbon-c-relay:$VERSION .

echo "docker build --tag=carbon-c-relay:latest ."
docker build --tag=carbon-c-relay:latest .
