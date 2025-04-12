.PHONY: bootstrap
miseBootstrap:
	sh ./scripts/miseBootstrap.sh
  
.PHONY: generate
tuistGenerate:
	sh ./scripts/tuistGenerate.sh
  
.PHONY: generate-no-open
tuistGenerate-no-open:
	sh ./scripts/tuistGenerate.sh --no-open

.PHONY: setupGithook
setupGithook:
	sh ./scripts/githookSetup.sh
