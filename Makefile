.PHONY: gcod
gcod:
	git submodule foreach 'git checkout develop'

.PHONY: gcom
gcom:
	git submodule foreach 'git checkout main'

.PHONY: gcov
gcov:
	while read -r repo version; do \
	  cd $$repo;                   \
	  git checkout $$version;      \
	  cd ..;                       \
	done <versions.txt             

.PHONY: gst
gst:
	git submodule foreach 'git status'


