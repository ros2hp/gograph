//go:build filelog
// +build filelog

package wrt

import (
	"io"
	"log"

	param "github.com/ros2hp/gograph/syslog/param"
)

func New() io.Writer {
	return param.FileLogr.Writer()
}
func Start(f *log.Logger) error {
	return nil
}

func Stop() {}
