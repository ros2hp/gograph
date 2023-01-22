//go:build dynamodb
// +build dynamodb

package tbl

type (
	Name string
)

var (
	TblName    Name = "GoGraph.Dev"
	Graph      Name = TblName
	Block      Name = TblName
	EOP        Name = TblName
	NodeScalar Name = TblName
	Reverse    Name = TblName
	edgePost   Name //= "-restored"
)

const (
	//
	Type Name = "GoGraphSS"
	//
	// Edge              Name = "Edge_"
	// EdgeChild         Name = "EdgeChild_"
	//	Mongr             Name = "mon_gr"
	Event             Name = "EV$event"
	TaskEv            Name = "EV$task"
	RunStat           Name = "runStats"
	Monrun            Name = "runStats"
	Eslog             Name = "esLog"
	State             Name = "State"
	AttachDetachEvent Name = "NodeAttachDetachEvent"
	//
	edge      Name = "Edge_"
	edgeChild Name = "EdgeChild_"
)

var (
	err error
	//
	tblEdge      Name
	tblEdgeChild Name
)

func Set(tblname string) {
	t := Name(tblname)
	TblName = t
	Graph = t
	Block = t
	EOP = t
	NodeScalar = t
	Reverse = t
}

func SetEdgeNames(g string) (Name, Name) {
	//
	// Regstier tables/indexes
	//
	tblEdge = edge + Name(g) + edgePost

	tblEdgeChild = edgeChild + Name(g) + edgePost

	return tblEdge, tblEdgeChild
}

func GetEdgeNames() (Name, Name) {
	return tblEdge, tblEdgeChild
}

// 	var k int
// 	if k, ok := keys[t]; ok {
// 		if len(k.pk) > 0 {
// 			k++
// 		}
// 		if len(k.sk) > 0 {
// 			k++
// 		}
// 	}
// 	return k
// }
