//go:build spanner
// +build spanner

package execute

import (
	"github.com/ros2hp/gograph/attach-merge/execute/internal/db"
	"github.com/ros2hp/method-db/tx"
)

// Spanner version

func checkOBatchSizeLimitReached(cUID util.UID, py blk.ChPayload) dbs.Mutation {

	return &db.WithOBatchLimit{Ouid: py.TUID, Cuid: cUID, Puid: pUID, DI: py.DI, OSortK: py.Osortk, Index: py.NdIndex}

}
