

build-reqs:
	pipenv requirements > requirements.txt
	pipenv requirements --dev-only > dev-requirements.txt

start:
	docker compose watch

stop-container:
	@echo "Fetching list of running containers..."
	@containers=$$(docker ps --format '{{.ID}}\t{{.Names}}'); \
	if [ -z "$$containers" ]; then \
		echo "No running containers found."; \
	else \
		echo "Select a container to stop:"; \
		oldIFS=$$IFS; \
		IFS=$$'\n'; \
		select container in $$containers; do \
			test -n "$$container" && break; \
			echo ">>> Invalid selection"; \
		done; \
		IFS=$$oldIFS; \
		container_id=$$(echo $$container | cut -f1); \
		echo "Stopping container $$container_id..."; \
		docker stop $$container_id; \
	fi

