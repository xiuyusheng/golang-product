package main

import (
	"QuestionnaireSurvey/controller"
)

func main() {
	// model.RDB.Set("test", "123123", 0)
	// fmt.Println(model.RDB.Get("test").Result())
	// token, _ := util.RsaEncryptBase64("123",util.)
	// fmt.Println(token)
	controller.Route.Run(":52273")
	// util.Positioning("120.236.153.101")
}
