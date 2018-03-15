FROM golang:1.10.0
ENV RULIOGOPATH="$GOPATH/src/github.com/Comcast/rulio"
RUN mkdir -p $RULIOGOPATH
ENV GOBIN=$GOPATH/bin
# COPY core $RULIOGOPATH/core
# COPY cron $RULIOGOPATH/cron
# COPY service $RULIOGOPATH/service
# COPY storage $RULIOGOPATH/storage
# COPY sys $RULIOGOPATH/sys
COPY rulesys /go/rulesys
ADD ./ $RULIOGOPATH/
RUN cd /go/rulesys && go get . && go install
EXPOSE 8001
ENTRYPOINT ["rulesys", "engine"]
