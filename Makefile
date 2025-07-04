GOSEC_VERSION = v2.22.0
GOSEC_BIN = ./bin/gosec

STATICCHECK_VERSION=latest
STATICCHECK_BIN=./bin/staticcheck

$(GOSEC_BIN):
	GOBIN=$(PWD)/bin go install github.com/securego/gosec/v2/cmd/gosec@$(GOSEC_VERSION)

gosec: $(GOSEC_BIN)
	$(GOSEC_BIN) ./...

$(STATICCHECK_BIN):
	GOBIN=$(PWD)/bin go install honnef.co/go/tools/cmd/staticcheck@$(STATICCHECK_VERSION)

staticcheck: $(STATICCHECK_BIN)
	$(STATICCHECK_BIN) ./...
