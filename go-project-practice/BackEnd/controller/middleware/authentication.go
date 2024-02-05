package middleware

import (
	"jiaowu/model"
	"jiaowu/util"

	"github.com/gin-gonic/gin"
)

func Auth(c *gin.Context) {
	auth, err := util.ParseTokenHs256(c.GetHeader("token"))
	if err != nil {
		c.JSON(200, gin.H{
			"code": 400, "Message": "登录失效",
		})
		c.Abort()
		return
	} else {
		switch auth.UserType {
		case 0:

		case 1:
			var stuo model.Studyone
			model.DB.Find(&stuo, model.Studyone{SOID: auth.UserID})
			if !stuo.IsEnable {
				c.JSON(200, gin.H{"code": 400, "Message": "账号已被禁用"})
				c.Abort()
				return
			}

		}
		c.Set("auth", auth)
		c.Next()
	}
}
