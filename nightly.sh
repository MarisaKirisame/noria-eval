set -x
set -e

docker ps
(docker run -d --name noria-eval zookeeper) || true
docker exec -i noria-eval bash < inside_docker.sh

docker cp noria-eval:output ./
nightly-results publish output
