SHELL=/bin/bash

.PHONY: run clean
run: clean
	docker compose up

clean:
	docker compose rm --force
