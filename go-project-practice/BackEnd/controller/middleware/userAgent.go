package middleware

import (
	"regexp"

	"github.com/gin-gonic/gin"
)

func ProcessingUserAgent(c *gin.Context) {
	re := regexp.MustCompile(`Mozilla/\d+\.\d+.*?(Chrome|Edge|Firefox)`)
	match := re.MatchString(c.GetHeader("User-Agent"))
	if match {
		c.Next()
	} else {
		c.String(400, "error")
		c.Abort()
	}
}
