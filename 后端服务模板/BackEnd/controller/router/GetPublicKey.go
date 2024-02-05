package router

import (
	"QuestionnaireSurvey/model"
	"QuestionnaireSurvey/util"
	"fmt"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

// ^ 获取公钥
func GetPublicKey(c *gin.Context) {
	User_Agent := c.GetHeader("User-Agent")
	PrivateKey, PublicKey := util.GenRsaKey()
	c.JSON(200, gin.H{
		"code":    http.StatusOK,
		"message": "success",
		"key":     PublicKey,
	})
	fmt.Println(util.RsaEncryptBase64("123", PublicKey))
	model.RDB.Set(User_Agent, PrivateKey, time.Duration(3)*time.Minute)
}
