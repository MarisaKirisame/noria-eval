docker ps
docker run -d --name noria-eval zookeeper || true
docker exec -i noria-eval bash < inside_docker.sh
