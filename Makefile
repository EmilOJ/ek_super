# 全サブリポをmainに切り替える
.PHONY: subs_main
checkout_develop:
	git submodule foreach 'git checkout develop'

# 全サブリポをdevelopに切り替える
.PHONY: subs_develop
checkout_main:
	git submodule foreach 'git checkout main'

# 全サブリポのgit statusを見る
.PHONY: subs_status
subs_status:
	git submodule foreach 'git status'


.PHONY: all_checkout_release
checkout_release: checkout_tag_super update_tags

# 全サブリポをversions.txtに指定されてるリリースに切り替える
.PHONY: subs_update_tag
subs_update_tag:
	while read -r repo version; do \
	  cd $$repo;                   \
	  git checkout $$version;      \
	  cd ..;                       \
	done <versions.txt

.PHONY: super_tag
super_tag:
	git checkout $$VERSION

