REPOS:= travis-perl5.10.1
REGISTORY := yowcow/$(REPOS)

all: build cpanfile.snapshot cpm-install lib lib/Hoge/Fuga/Message.pm

build:
	docker build -t $(REGISTORY) .

cpanfile.snapshot: cpanfile
	docker run --rm -v `pwd`:/$(REPOS) -w /$(REPOS) $(REGISTORY) \
		carton install

lib/Hoge/Fuga/Message.pm: proto/message.proto
	docker run --rm -v `pwd`:/$(REPOS) -w /$(REPOS) $(REGISTORY) \
		carton exec -- protoc --perl-gpd_out=package=Hoge.Fuga.Message,implicit_maps:lib $^

lib:
	mkdir -p $@

test:
	docker run --rm -v `pwd`:/$(REPOS) -w /$(REPOS) $(REGISTORY) \
		carton exec -- prove -Ilib t

debug:
	docker run --rm -v `pwd`:/$(REPOS) -w /$(REPOS) -it $(REGISTORY) bash

cpm-install:
	docker run --rm -v `pwd`:/$(REPOS) -w /$(REPOS) $(REGISTORY) \
		cpm install --snapshot=./cpanfile.snapshot

.PHONY: build test debug cpm-install
