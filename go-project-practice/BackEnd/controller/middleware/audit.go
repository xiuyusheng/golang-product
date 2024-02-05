package middleware

import "github.com/gin-gonic/gin"

func Audit(c *gin.Context) {
	var params []string = []string{"CertificateID"}
	for _, v := range params {
		if c.PostForm(v) == "" {
			c.JSON(200, gin.H{
				"code": 400, "Message": "未指定证书",
			})
			c.Abort()
			return
		}
	}
}
