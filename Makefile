docker:
	docker-compose up -d --no-deps --build

down:
	docker-compose down

meili:
	# Launch Meilisearch in development mode with a master key
	docker run -it --rm \
		-p 7700:7700 \
		-e MEILI_MASTER_KEY='xcz'\
		-v $(pwd)/meili_data:/meili_data \
		getmeili/meilisearch:v0.30 \
		meilisearch --env="development"

frontend:
	yarn && yarn serve

data:
	pip install -r requirements.txt
	cd setup && python3 importer.py

log:
	docker logs --tail 50 --follow meilisearch

kill:
	sudo docker rm $(sudo docker ps -aq)

.PHONY: clean
clean:
	rm -f meilisearch/ node_modules
