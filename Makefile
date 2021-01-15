
.PHONY: all
all: app iac

.PHONY: app
app:
	./.src/app.sh

.PHONY: iac
iac:
	./.src/iac.sh

