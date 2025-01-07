

build: 
	docker build ./docker -t oabe_image_hl
	 
buildnocache:
	docker build ./docker --no-cache -t oabe_image_hl

run:
	docker run -it --name oabe_container_hl oabe_image_hl

start:
	docker start oabe_container_hl

stop:
	docker stop oabe_container_hl

exec:
	docker exec -it oabe_container_hl /bin/bash
	
execroot:
	docker exec -it --user root oabe_container_hl /bin/bash
