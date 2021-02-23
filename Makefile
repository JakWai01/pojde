all: build build-openrc

.PHONY: build apply

pre:
	chmod +x ./build/*.sh
	chmod +x ./configuration/*.sh
	chmod +x ./bin/*

build: pre
	docker build --build-arg POJDE_NG_OPENRC=false -t pojntfx/pojde-ng:latest .

build-openrc: pre
	docker build --build-arg POJDE_NG_OPENRC=true -t pojntfx/pojde-ng:latest-openrc .

link: pre
	sudo ln -sf "$(shell pwd)/bin/pojdectl" /usr/bin/pojdectl

install:
	sudo install bin/pojdectl /usr/bin

uninstall:
	sudo rm /usr/bin/pojdectl
