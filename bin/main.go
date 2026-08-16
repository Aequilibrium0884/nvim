package main

import (
	"errors"
	"fmt"
	"log"
	"os"
	"os/user"
	"path"
)

var (
	nvimInstalled    bool
	pyvenvInstalled  bool
	fzfInstalled     bool
	ripGrepInstalled bool
	npmInstalled     bool
	cargoInstalled   bool
	userName         string
)

var (
	// placeHolderDir      = "/home"
	activeUserName      = os.Getenv("SUDO_USER")
	nvimConfigDirectory = path.Join(os.Getenv("XDG_CONFIG_HOME"), "nvim")
	nvimLocalDirectory  = path.Join(os.Getenv("XDG_DATA_HOME"), "nvim")
	nvimStateDirectory  = path.Join(os.Getenv("XDG_DATA_HOME"), "state", "nvim")
	masonPythonVenv     = path.Join(os.Getenv("XDG_DATA_HOME"), "share", "mason-python")
	tmpNvim             = path.Join("/tmp", fmt.Sprintf("nvim.%s", activeUserName))

	// errors
	ErrLackOfPrivilleges = errors.New("Has To Be Run As Root")
)

var EffectedUser *user.User

func main() {
}

func getUser() error {
	if os.Geteuid() != int(0) {
		return ErrLackOfPrivilleges
	}
	var err error

	EffectedUser, err = user.Current()
	if err != nil {
		log.Fatal(err)
	}

	return nil
}

func Presence() {
}
