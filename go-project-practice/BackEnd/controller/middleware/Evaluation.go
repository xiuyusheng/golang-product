package middleware

import "github.com/gin-gonic/gin"

func Evaluation(c *gin.Context) {
	_, err := c.FormFile("file")
	if err != nil {
		c.JSON(201, gin.H{
			"code":    400,
			"Message": "图片读取错误",
		})
		c.Abort()
		return
	}
	if c.PostForm("IssuanceDate") == "" || c.PostForm("AttributableID") == "" || c.PostForm("CertificateLevel") == "" || c.PostForm("CertificateAuthority") == "" || c.PostForm("CertificateName") == "" || c.PostForm("IdentifyLocations") == "" {
		c.JSON(200, gin.H{
			"code":    400,
			"Message": "Fields are missing",
		})
		c.Abort()
		return
	}
	c.Next()
}
