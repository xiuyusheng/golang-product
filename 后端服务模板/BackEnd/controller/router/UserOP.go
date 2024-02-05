package router

import (
	"QuestionnaireSurvey/model"
	"QuestionnaireSurvey/util"

	"github.com/gin-gonic/gin"
)

func GetUserInfo(c *gin.Context) { //^获取用户信息
	User_data, _ := c.Get("User")
	user := User_data.(*util.MyCustomClaims)
	type message struct {
		UserId   string `gorm:"column:UserID"`
		UserName string `gorm:"column:UserName"`
		Email    string `gorm:"column:Email"`
		Sex      string `gorm:"column:Sex"`
	}
	var data message
	data.UserId = user.UserID
	model.DB.Model(model.User{}).Select("UserID,UserName,Email,Sex").Find(&data)
	c.JSON(200, gin.H{
		"code": 200,
		"data": data,
	})
}
