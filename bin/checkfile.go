package main

import (
	"errors"
	"fmt"
	"io/fs"
	"log"
	"os"
	"sync"
	"syscall"
)

type SafeMap[T comparable, V any] struct {
	Map   map[T]V
	Mutex sync.RWMutex
}

type PathFiles struct {
	FilePaths []string
	SafeMap   *SafeMap[string, *syscall.Stat_t]
}

var ErrNoEffectedUser = errors.New("No User To Work With")

func NewSafeMap[T comparable, V any]() *SafeMap[T, V] {
	b := make(map[T]V, 0)
	return &SafeMap[T, V]{
		Map: b,
	}
}

func NewPathFiles(filepath ...string) *PathFiles {
	return &PathFiles{
		SafeMap:   NewSafeMap[string, *syscall.Stat_t](),
		FilePaths: filepath,
	}
}

func (pf *PathFiles) Presence(filepath string) (os.FileInfo, bool, error) {
	f, err := os.Lstat(filepath)
	if err != nil {
		if errors.Is(err, fs.ErrNotExist) {
			return f, false, nil
		}
		return f, false, err
	}
	return f, true, nil
}

func (pf *PathFiles) Prepare() error {
	doesntExist, err := pf.Circle()
	if err != nil {
		return err
	}
	err = pf.CreateDir(doesntExist)
	if err != nil {
		return err
	}
	return nil
}

func (pf *PathFiles) Circle() (*SafeMap[string, *syscall.Stat_t], error) {
	doesntExist := NewSafeMap[string, *syscall.Stat_t]()

	for _, val := range pf.FilePaths {

		f, exist, err := pf.Presence(val)
		if !exist {
			log.Printf("%s Doesn't Exist", val)
			log.Println("Continuing ................")
			err := doesntExist.Add(val, nil, true)
			if err != nil {
				return nil, err
			}
			continue
		}
		if err != nil {
			return nil, err
		}
		err = pf.GetStat(val, f)
		if err != nil {
			return nil, err
		}
		log.Printf("%s Exists", val)
	}
	return doesntExist, nil
}

func (pf *PathFiles) GetStat(key string, fileinfo os.FileInfo) error {
	info, success := fileinfo.Sys().(*syscall.Stat_t)
	if !success {
		return errors.New("stat was unsuccessful")
	}
	err := pf.SafeMap.Add(key, info, true)
	if err != nil {
		return err
	}
	return nil
}

func (sm *SafeMap[T, V]) Add(key T, value V, change bool) error {
	sm.Mutex.Lock()
	defer sm.Mutex.Unlock()
	if _, success := sm.Map[key]; success {
		if change {
			sm.Map[key] = value
			log.Printf("Adding to Map key %v", key)
		}
		err := fmt.Errorf("%v is already present in safemap", key)
		return err
	}
	sm.Map[key] = value
	return nil
}

func (sm *SafeMap[T, V]) Remove(key T, value V) {
	sm.Mutex.Lock()
	defer sm.Mutex.Unlock()
	delete(sm.Map, key)
}
