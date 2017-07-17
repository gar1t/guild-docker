GUILD_HOME=../guild

build: release version
	docker build --build-arg version=$(VERSION) --tag=guild .

release: version
	@if [ ! -e guild_$(VERSION)_linux_x86_64.tar.gz ]; then \
	  ( cd $(GUILD_HOME) && make VERSION=$(VERSION) release ); \
	  cp $(GUILD_HOME)/releases/guild_$(VERSION)_linux_x86_64.tar.gz . ; \
	fi

version:
	@if [ -z "$(VERSION)" ]; then \
	echo "VERSION must be defined"; \
	  exit 1; \
	fi
