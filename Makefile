run:
	# Launch Meilisearch in development mode with a master key
	docker run -it --rm \
		-p 7700:7700 \
		-e MEILI_MASTER_KEY='xcz'\
		-v $(pwd)/meili_data:/meili_data \
		getmeili/meilisearch:v0.30 \
		meilisearch --env="development"