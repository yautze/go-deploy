package main

import (
	"go-deploy/app/config"
	"go-deploy/cmd"
)

//
var (
	VERSION string
	COMMIT  string
	BUILD   string
)

func main() {
	config.Version = VERSION
	config.Commit = COMMIT
	config.Build = BUILD

	cmd.Execute()
}
