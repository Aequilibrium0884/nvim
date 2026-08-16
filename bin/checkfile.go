package main

import (
	"errors"
	"io/fs"
	"log"
	"os"
	"strconv"
	"sync"
	"syscall"
)

type SafeMap struct {
	Map   map[string]bool
	Mutex sync.RWMutex
}

var ErrNoEffectedUser = errors.New("No User To Work With")

type PathFiles struct {
	FilePaths []string
	Map       *SafeMap
}

func NewSafeMap() *SafeMap {
	b := make(map[string]bool, 0)
	return &SafeMap{
		Map: b,
	}
}

func NewPathFiles(filepath ...string) *PathFiles {
	return &PathFiles{
		Map:       NewSafeMap(),
		FilePaths: filepath,
	}
}

func (f *PathFiles) GetStat() {
	for _, val := range f.FilePaths {

		stat, err := os.Stat(val)
		if err != nil {
			if errors.Is(err, fs.ErrNotExist) {
				f.Map.Map[val] = false
			}
		} else {
			log.Println("Found file ", filepath)
			info, success := stat.Sys().(*syscall.Stat_t)
			if !success {
				return nil, errors.New("")
			}
			return info, nil
		}
	}

	log.Println("checking file existence = ", filepath)
	return nil, nil
}

func CheckFile() error {
	// checkFileMap := NewSafeMap()
	values := []string{
		nvimConfigDirectory,
		nvimLocalDirectory,
		nvimStateDirectory,
		masonPythonVenv,
		tmpNvim,
	}

	for _, val := range values {
		check, err := os.Stat(val)
		if err != nil {
			log.Printf("%T", err)
			return err
		}
		info, f := check.Sys().(*syscall.Stat_t)
		if !f {
			return errors.New("unsuccessful")
		}
		uu, err := strconv.ParseUint(EffectedUser.Uid, 10, 32)
		if err != nil {
			log.Printf("%T", err)
			return err
		}

		if info.Uid != uint32(uu) {
			return errors.New("non")
		}
		log.Println(val)
	}

	if EffectedUser.Username == "" && EffectedUser.Uid == "" {
		return ErrNoEffectedUser
	}
	return nil
}
