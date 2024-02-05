package main

import (
	"fmt"
	"jiaowu/controller"
	"jiaowu/util"
)

func main() {
	// fmt.Println(util.MD5("20030216"))
	// f_log, _ := os.Create("Serve.log")
	// gin.DefaultWriter = io.MultiWriter(f_log, os.Stdout)
	// studyone := &model.Studyone{}
	// model.DB.Debug().Take(studyone)

	// token, _ := util.GenerateTokenUsingHs256(2105330154, "沈浩英")
	// t := time.Hour * time.Duration(pkg.Package.Jwt.Registeredclaims.Hour)
	// t1 := time.Second
	// fmt.Println(util.ParseTokenHs256(token))
	// fmt.Println(t > t1)

	// fmt.Printf("公钥：%s\n", util.PublicKey)
	encode, _ := util.RsaEncryptBase64("123123", util.PublicKey)
	fmt.Printf("密文：%s\n", encode)
	// fmt.Println(controller.GetPath())
	controller.Router.Run(":52273")
	// util.WriteExcel()

	// util.Delete_Cos("9qJODbsu7v")

	// fmt.Println(int(time.Now().Unix()))

	// // fmt.Printf("私钥：%s\n", a)
	// // decode, _ := util.RsaDecryptBase64(encode, a)
	// // fmt.Printf("明文：%s\n", decode)
	// controller.Router.Run(":52273")
}
