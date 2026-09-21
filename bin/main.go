package main

import (
	"log"
	"os"
	"os/exec"
	"strings"
)

func main() {
	packages := []string{
		"ansible-lint",
		"hadolint",
		"systemdlint",
		"bash-language-server",
		"shellcheck",
		"golangci-lint-langserver",
		"postgres-language-server",
		"json-lsp",
		"lua-language-server",
		"stylua",
		"jq-lsp",
		"shfmt",
		"ruff",
		"black",
		"prettier",
		"dockerfile-language-server",
		"pgformatter",
		"sqlfluff",
		"gotests",
		"gomodifytags",
		"goimports-reviser",
		"goimports",
		"gofumpt",
		"golines",
	}

	masonInstall := "+MasonInstall " + strings.Join(packages, " ")

	cmd := exec.Command(
		"nvim",
		"--headless",
		masonInstall,
		"+qa",
	)

	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	cmd.Stdin = os.Stdin

	if err := cmd.Run(); err != nil {
		log.Fatal(err)
	}
}
