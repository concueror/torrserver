FROM alpine:latest

ENV GO_VERSION 1.12.6
ENV GO_BUNDLE go$GO_VERSION.linux-alpine-amd64.tar.gz
ENV GO_URL http://resin-packages.s3.amazonaws.com/golang/v$GO_VERSION/$GO_BUNDLE
ENV GO_CRC cfe52b99a1b76b93da9d381027af47a62b8d0c6278cefd6186d1dd6fa450204b
ENV WORK /tmp/TorrServer
ENV GODIR /usr/local/go

RUN	apk add curl g++ git && \
	echo "Installing Go..." && \
	mkdir -p /usr/local/go && \
	curl -SLO "$GO_URL" && \
	echo "$GO_CRC  $GO_BUNDLE" | sha256sum -c - && \
	tar -xzf $GO_BUNDLE -C /usr/local/go --strip-components=1 && \
	rm -f $GO_BUNDLE && \
	cd /tmp && git clone https://github.com/YouROK/TorrServer.git && \
	echo "Getting all project dependencies..." && \
	cd $WORK && GOPATH=$WORK GOBIN=$GODIR/bin $GODIR/bin/go get -fix ./... >/dev/null 2>&1 || : && \
	mkdir -p $WORK/src/github.com/anacrolix && \
	cd $WORK/src/github.com/anacrolix && \
	git clone https://github.com/anacrolix/utp.git && \
	echo "Compiling TorrServer..." && \
	cd $WORK && GOPATH=$WORK GOOS=linux GOARCH=amd64 $GODIR/bin/go build -o dist/TorrServer main && mv dist/TorrServer / && \
	rm -rf /var/cache/apk/* /usr/local/go /tmp /root/.cache/go-build && \
	apk del curl g++ git && apk add libc-dev libstdc++

EXPOSE 8090:8090
CMD ["/TorrServer"]
