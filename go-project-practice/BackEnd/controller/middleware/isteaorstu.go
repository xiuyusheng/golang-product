package middleware

import (
	"jiaowu/util"

	"github.com/gin-gonic/gin"
)

func IsStu(c *gin.Context) {
	auth, _ := c.Get("auth")
	auth_, ok := auth.(*util.MyCustomClaims)
	if !ok {
		c.JSON(200, gin.H{
			"code": 400, "Message": "身份错误",
		})
		c.Abort()
		return
	} else {
		if auth_.UserType != 1 {
			c.JSON(200, gin.H{"code": 400, "Message": "不是学委"})
			c.Abort()
			return
		}
		c.Next()
	}
}
func IsTea(c *gin.Context) {
	auth, _ := c.Get("auth")
	auth_, ok := auth.(*util.MyCustomClaims)
	if !ok {
		c.JSON(200, gin.H{
			"code": 400, "Message": "身份错误",
		})

		c.Abort()
		return
	} else {
		if auth_.UserType != 0 {
			c.JSON(200, gin.H{"code": 400, "Message": "不是老师"})
			c.Abort()
			return
		}

		c.Next()

	}
}
