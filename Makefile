.PHONY: bootstrap
miseBootstrap:
	sh ./etc/script/tuist/miseBootstrap.sh
  
.PHONY: generate
tuistGenerate:
	sh ./etc/script/tuist/tuistGenerate.sh
  
.PHONY: generate-no-open
tuistGenerate-no-open:
	sh ./etc/script/tuist/tuistGenerate.sh --no-open
