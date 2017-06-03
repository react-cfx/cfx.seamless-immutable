#
pjName := cfx.seamless-immutable

docker:
	docker run \
		--name ${pjName} \
		--rm \
		-ti \
		-v $$(pwd):/root/${pjName} \
		mooxe/node \
		/bin/bash

clean:
	rm -rf $$(pwd)/build

build: clean
	mkdir -p build
	coffee -p src/index.coffee | babel --presets env > build/index.js
