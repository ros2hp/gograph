package execute

import (
	"context"
	"fmt"
	"sync"
	"testing"

	atds "github.com/GoGraph/attach-merge/ds"
	"github.com/GoGraph/db"
	"github.com/GoGraph/grmgr"
	slog "github.com/GoGraph/syslog"
	"github.com/GoGraph/types"
	"github.com/GoGraph/uuid"
)

func syslog(s string) {
	slog.Log("testAttach", s)
}

func TestOvflAttach(t *testing.T) {

	var (
		err   error
		wpEnd sync.WaitGroup
	)
	wpEnd.Add(1)
	edges := []*atds.Edge{
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("+c81c9yqR/KY06175OMjyw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("0IaYiqocSMyRKgOcnoVcgw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("10gsnpWHTaiD32+ZBGohVg==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("2LCNy9pSQo22zUaGSgZBEA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("3YdmhjP6T2u/XHUdyjHc1A==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("47Ee5yJDS3qrtnZ4IkjFyA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("58n2k8XfTZqKDsECLZUahA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("6W5k7d80QHmpF73dP1MfPA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("7CSyPdHuRVKNuLIvV9GkIg==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("8tbzUSZMRImRQ78Dpa3iJg==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("a234BZ0XS2SCN+LardinhQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("aOoGr98ZQk2idTA8cvKKLQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("atBtTjDnS36JN4QMuyIAfw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("B/nVf8S3Tyi5Nn0rHZyN2w==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("C9M2fpFGTKSVH7lAZ5dpdw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("D7glhB0zSBS7pUtoeBFvIw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("D858YJhgRDyCwVbireK2+g==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("DbDNsCHvSPqK45/25KR2vQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("DFAwCyfZTIuvQkB7N+ZRkQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("DsHoPhexTRyXBGMBZ1yreQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("DZXuAqTZTAOkFWRpEFrEDg==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("FI9K+XBARPaDAe60ZVZ/qA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("Fl/VvYDmTquz83AKvp1bow==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("fOH5UyoTSo+Ryfg/UfBfIA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("g2BZsoA0Qruo5/HvzDQ3eQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("gAkIYiP+TrKiPC7bL9iiGQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("gvlQrhDrRFmyXJiLKIcLiw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("gwmBMvjBSimrtFhQF90m4Q==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("Hl1cPeMgTmaWc36nKfRiuA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("hp0ctp2MTGO4wMjwM10b3Q==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("hq43gOIpRdGJggs7KdOIbQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("hr64uOAMTveK862E/G85tQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("jK4S+vXaRfWjXrQnQpDohw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("jU6Rc9CBSpyYQ8yfjID2Rw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("k3GvTvm2Rl6+Dkw6TEmknw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("kvp+FU6HRCCiDMVwtlZXkA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("KZFJk4U8TGCNitVy2hM7Mw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("mHEeU7dBTPWdt+XytxnVIQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("MLhQ6QCtR4OVpwpMfqrdCA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("ODwxAKifT0GAmBModXT7/w==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("ohABk+glRTm3VdIzhkFw1w==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("oUe86I4SSSyVN4tKw1L7Qw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("pE5wW1iqSKqh4u0p42cp9Q==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("PfJfwyM8R+qsFyyvKZNrJg==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("qm9z3mGbQiOEobzZyIsKnQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("quVVVugARJCAuvh3bzZ8LA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("QveOZKvdR3uzGIt7ZiMaEQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("qy2VSv5sSpWzBesJG1D8XA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("Ra6FVZpqRuaYDIqz7sJwZQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("RhfcIe8mTTmKtJuvSqoRXw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("rqb5No8YTKeI118ZLUQVYA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("rrIg+7B7Shej9lR5fC7ASA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("rVgRdUVbS8GEa2xozmtJRA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("sIAQVeujSQuKTWuQJUJkIg==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("T1dzF4owQRiNZs+gkQGMgw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("T6xRvk/wRfSLH27TSE1XDg==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("tt8VJdh7T06YHDMzPCzAlw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("tvt/9kSURVa66j4H+5/UbQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("u5KGbUg5QdWDV1CcRNZoVw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("Urvz1S3iTxqDbFUGmLS1sA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("vMwTh/EJSCer/oFhmIJOcA==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("Vz2Rs1g4TfWnXkVd7N6g4g==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("w6bC+5xXSZqF+a9MZUjSFg==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("wflyLWblR3SNXd1pksWmcw==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("WkVeqS4mTFmSyuDI5VTAvQ==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("wVDq4lqvSg+L1k5Ofllq6g==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("xic6mh2LSEmjfxNAoPRz2w==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("Y6eLeGZCRzOwimvR3JCROg==")), Sortk: "m|A#G#:P"},
		&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64("LmMn4F/HQ0WBBfDVJnrUYQ==")), Cuid: uuid.DecodeBase64(uuid.UIDb64("Zaz0Of+wS6CQP9LwskbTMA==")), Sortk: "m|A#G#:P"},
	}

	// start any syslog services - dependency on runid
	err = slog.Start()
	if err != nil {
		fmt.Println("Error: ", err)
		panic(err)
	} else {
		fmt.Println("\n no error ")
	}

	// edgeCh = make(chan *ds.Edge, 20)
	// moreEdgesCh = make(chan struct{})
	//	scanCh = make(chan scanStatus)

	// set Graph and load types into memory - dependency on syslog
	graph := "Movies"
	err = types.SetGraph(graph)
	if err != nil {
		syslog(fmt.Sprintf("Error in SetGraph: %s ", err.Error()))
		fmt.Printf("Error in SetGraph: %s\n", err)
		return
	}
	db.Init(context.TODO(), &wpEnd, []db.Option{db.Option{Name: "throttler", Val: grmgr.Control}, db.Option{Name: "Region", Val: "us-east-1"}}...)

	AttachNodeEdges_test(context.TODO(), edges, false)

}
