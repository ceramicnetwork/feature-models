COMPOSEDB_CMD ?= composedb

.PHONY: deploy
deploy: composite.json
	$(COMPOSEDB_CMD) composite:deploy composite.json

composites/%.json: models/%.graphql
	$(COMPOSEDB_CMD) composite:create $< --output $@

composite.json: composites/*.json
	$(COMPOSEDB_CMD) composite:merge $^ --output $@
