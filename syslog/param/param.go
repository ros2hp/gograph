package param

import (
	"io"
	"log"
)

var (
	FileWriter io.Writer
	//LogFile    string
	FileLogr *log.Logger
	LogFile  string
	RunId    string
)

const (
	StatsSystemTag string = "__system"
)
