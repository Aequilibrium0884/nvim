#!/usr/bin/env sh
#
# Description of the script.
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/stringer@latest

go install mvdan.cc/gofumpt@latest
go install github.com/segmentio/golines@latest
go install github.com/incu6us/goimports-reviser/v3@latest

go install github.com/cweill/gotests/gotests@latest
go install github.com/fatih/gomodifytags@latest
go install github.com/josharian/impl@latest
go install gotest.tools/gotestsum@latest

go install github.com/go-delve/delve/cmd/dlv@latest

go install honnef.co/go/tools/cmd/staticcheck@latest
go install github.com/securego/gosec/v2/cmd/gosec@latest
go install go.uber.org/nilaway/cmd/nilaway@latest
go install golang.org/x/vuln/cmd/govulncheck@latest

go install github.com/air-verse/air@latest
