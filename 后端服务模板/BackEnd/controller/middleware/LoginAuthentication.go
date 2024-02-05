package middleware

import (
	"QuestionnaireSurvey/model"
	"QuestionnaireSurvey/util"
	"net/http"

	"github.com/gin-gonic/gin"
)

func LoginAuthentication(c *gin.Context) {
	token := c.GetHeader("token")
	user, err := util.ParseTokenHs256(token)
	if err != nil {
		c.JSON(200, gin.H{
			"code":    http.StatusUnauthorized,
			"message": "登录失效",
		})
		c.Abort()
	} else {
		if tokenid := model.RDB.Get(user.UserID).Val(); tokenid != user.RegisteredClaims.ID {
			c.JSON(200, gin.H{
				"code":    http.StatusUnauthorized,
				"message": "账号已在其他地方登录",
			})
			return
		}
		var user_ model.User
		if model.DB.Model(&model.User{}).Where("UserID = ?", user.UserID).Find(&user_); user_.IsEnable {
			c.Set("User", user)
			c.Next()
		} else {
			c.JSON(200, gin.H{
				"code":    http.StatusUnauthorized,
				"message": "账号已被禁用",
			})
			c.Abort()
		}
	}

}
