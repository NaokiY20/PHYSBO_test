IMAGE_NAME = physbo:1.0
CONTAINER_NAME = PHYSBO

# VOLUME_OPTIONS = `pwd`/workspace:/home/user/workspace
VOLUME_OPTIONS = `pwd`/workspace:/workspace

# make(make create)でイメージのビルドからコンテナ作成まで実行。
# attach: runningのコンテナの中に入る。
# start: コンテナを開始する。
# stop: コンテナを停止する。
# allrm: コンテナとイメージをすべて削除する。



create: build run

build:
	docker image build ./ -t $(IMAGE_NAME) -f `pwd`/Dockerfiles/Dockerfile


run:
	docker run -it --name $(CONTAINER_NAME) -d -v $(VOLUME_OPTIONS) $(IMAGE_NAME)  

allrm: stop rm rmi

rm:
	docker rm $(CONTAINER_NAME)

rmi:
	docker rmi $(IMAGE_NAME)


attach:
	docker attach $(CONTAINER_NAME)

start:
	docker start $(CONTAINER_NAME)

stop:
	docker stop $(CONTAINER_NAME)

exec:
	docker exec $(CONTAINER_NAME) bash



