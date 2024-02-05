package util

import (
	"crypto/md5"
	"fmt"
)

var RandTeaCookie, RandStuCookie string

// ?定时cookie
// func init() {
// 	// 设置定时器，每隔一段时间执行一次任务
// 	interval := time.Duration(pkg.Package.Timing) * time.Hour // 每隔24小时执行一次任务
// 	timer := time.NewTicker(interval)
// 	RandStuCookie = MD5(RandStr(10))
// 	RandTeaCookie = MD5(RandStr(30))
// 	// 启动一个goroutine来执行定时任务
// 	go func() {
// 		for {
// 			select {
// 			case <-timer.C:
// 				fmt.Printf("1")
// 				RandStuCookie = MD5(RandStr(10))
// 				RandTeaCookie = MD5(RandStr(30))
// 			}
// 		}
// 	}()
// }

func MD5(str string) string {
	data := []byte(str) //切片
	has := md5.Sum(data)
	md5str := fmt.Sprintf("%x", has) //将[]byte转成16进制
	return md5str
}
