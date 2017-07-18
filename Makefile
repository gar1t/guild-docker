GUILD_HOME=../guild

build: version release guild-bashrc
	docker build --build-arg version=$(VERSION) --tag=guild .

version:
	@if [ -z "$(VERSION)" ]; then \
	  echo "VERSION must be defined"; \
	  exit 1; \
	fi

release: version
	@if [ ! -e guild_$(VERSION)_linux_x86_64.tar.gz ]; then \
	  ( cd $(GUILD_HOME) && make VERSION=$(VERSION) release ); \
	  cp $(GUILD_HOME)/releases/guild_$(VERSION)_linux_x86_64.tar.gz . ; \
	fi

guild-bashrc: version guild-bashrc.in
	sed s/VERSION/$(VERSION)/ guild-bashrc.in > guild-bashrc

run:
	docker run -it -p 6333:6333 guild

start:
	docker start -ia `docker ps -a | grep -m1 guild | awk '{ print $$1}'`

attach:
	docker exec -it `docker ps -a | grep -m1 guild | awk '{ print $$1}'` /bin/bash

clean:
	rm guild_*_linux_x86_64.tar.gz
