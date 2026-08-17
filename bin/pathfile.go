package main

import (
	"errors"
	"io/fs"
	"log"
	"os"
	"path/filepath"
	"strconv"
	"syscall"
)

var (
	EffectedUserGID uint32
	EffectedUserUID uint32
)

func (pf *PathFiles) EnsureOwnership(key string, de fs.DirEntry) error {
	uuid, err := strconv.ParseUint(EffectedUser.Uid, 10, 32)
	if err != nil {
		return err
	}

	gid, err := strconv.ParseUint(EffectedUser.Gid, 10, 32)
	if err != nil {
		return err
	}
	info, err := de.Info()
	if err != nil {
		return err
	}
	stat, success := info.Sys().(*syscall.Stat_t)
	if !success {
		return errors.New("Value")
	}

	if stat.Uid != uint32(uuid) || stat.Gid != uint32(gid) {
		err := os.Chown(key, int(uuid), int(gid))
		if err != nil {
			return err
		}
	}

	return nil
}

func ChangePermissions(path string, de fs.DirEntry) error {
	info, err := de.Info()
	if err != nil {
		return err
	}

	if info.IsDir() {
		err := os.Chmod(path, os.FileMode(0o755))
		if err != nil {
			return err
		}
	} else {

		err := os.Chmod(path, os.FileMode(0o644))
		if err != nil {
			return err
		}
	}
	return nil
}

func (pf *PathFiles) CheckFilePermissions() error {
	for mpath := range pf.SafeMap.Map {
		log.Println("Walking Through Directory")
		verr := filepath.WalkDir(mpath,
			func(path string, d fs.DirEntry, err error) error {
				log.Println(path)
				nerr := pf.EnsureOwnership(path, d)
				if nerr != nil {
					return err
				}
				merr := ChangePermissions(path, d)
				if merr != nil {
					return err
				}
				return nil
			})

		if verr != nil {
			return verr
		}
	}
	return nil
}

func (pf *PathFiles) CreateDir(val *SafeMap[string, *syscall.Stat_t]) error {
	for value := range val.Map {
		err := os.MkdirAll(value, 0o755)
		if err != nil {
			return err
		}

		f, exists, err := pf.Presence(value)
		if !exists {
			return err
		}

		delete(val.Map, value)
		err = pf.GetStat(value, f)
		if err != nil {
			return err
		}

		log.Printf("Value %v Has Been Created", value)
	}

	return nil
}
