package middleware

import (
	"fmt"
	"jiaowu/model"
	"jiaowu/util"
	"strconv"

	"github.com/gin-gonic/gin"
)

func Alibration(c *gin.Context) {
	auth, _ := c.Get("auth")
	auth_, _ := auth.(*util.MyCustomClaims)
	if auth_.UserType == 1 {
		ID, err := strconv.Atoi(c.PostForm("AttributableID"))
		if err != nil {
			c.JSON(200, gin.H{"code": 400, "Message": "AttributableID error"})
			c.Abort()
			return
		}

		var stu model.Student
		model.DB.Select("ClassID").Find(&stu, model.Student{SID: ID})
		if stu.ClassID == 0 {
			c.JSON(200, gin.H{"code": 400, "Message": "查询不到学生"})
			c.Abort()
			return
		}
		var stuo model.Studyone

		model.DB.Select("ClassID").Find(&stuo, model.Studyone{SOID: auth_.UserID})
		fmt.Println(stuo.ClassID != stu.ClassID, stuo.ClassID, stu.ClassID)
		if stuo.ClassID == stu.ClassID {
			c.Next()
		} else {
			c.JSON(200, gin.H{"code": 400, "Message": "学生与学委所在班级不一致"})
			c.Abort()
			return
		}
	}
	c.Next()
}
