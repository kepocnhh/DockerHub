from kepocnhh/dex-antelope:0.1

arg EXPECTED
env EXPECTED=$EXPECTED

workdir /workspace

run /bin/echo -e "\
from kepocnhh/debianex:bullseye-1\n\
arg EXPECTED\n\
run echo \"\$EXPECTED\" > /tmp/result\
" > internal.Dockerfile

cmd /usr/local/bin/run_docker_daemon.sh \
 && docker build -f internal.Dockerfile --build-arg EXPECTED=$EXPECTED -t dindi . \
 && docker run --name dindc dindi \
 && docker cp dindc:/tmp/result /tmp/result \
 && docker stop dindc \
 && docker rm -f dindc \
