package main

import (
	"errors"
	"fmt"
	"log"
	"os"
	"os/user"
	"path"
	"strconv"
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
	placeHolderDir      = "/home"
	activeUserName      = os.Getenv("SUDO_USER")
	nvimConfigDirectory = path.Join(os.Getenv("XDG_CONFIG_HOME"), "nvim")
	nvimLocalDirectory  = path.Join(os.Getenv("XDG_DATA_HOME"), "nvim")
	nvimStateDirectory  = path.Join(os.Getenv("XDG_DATA_HOME"), "state", "nvim")
	masonPythonVenv     = path.Join(os.Getenv("XDG_DATA_HOME"), "share", "mason-python")
	tmpNvim             = path.Join("/tmp", fmt.Sprintf("nvim.%s", activeUserName))

	// errors
	ErrLackOfPrivilleges = errors.New("Has To Be Run As Root")
)

func main() {
	log.Println(os.Geteuid())
	err := getUser()
	if err != nil {
		log.Fatal(err)
	}
	// activeUserName = "hassan"
	log.Println(os.Getuid())
	log.Println(nvimConfigDirectory)
	log.Println(nvimLocalDirectory)
	log.Println(nvimStateDirectory)
	log.Println(masonPythonVenv)
	log.Println(activeUserName)
	log.Println(tmpNvim)
}

type SafeMap struct {
	Map map[string]bool
}

func getUser() error {
	if os.Geteuid() != int(0) {
		return ErrLackOfPrivilleges
	}

	value := strconv.Itoa(os.Getuid())
	user, err := user.LookupId(value)
	if err != nil {
		return err
	}
	log.Println("GETUID = ", value)
	log.Println("Name = ", user.Name)
	log.Println("HomeDir = ", user.HomeDir)
	log.Println("UserName = ", user.Username)
	log.Println("UID = ", user.Uid)
	log.Println("GID = ", user.Gid)

	return nil
}

func Presence() {
}
