package controller

import (
	"QuestionnaireSurvey/conf"
	"QuestionnaireSurvey/controller/middleware"
	"QuestionnaireSurvey/controller/router"

	"github.com/gin-gonic/gin"
)

var Route = gin.Default()

// ?配置
func Routing_Configuration() {
	//!路由日志
	middleware.InitLogger(&conf.Config.Log) //初始化日志配置
	Route.Use(middleware.GinLogger)

	//!未知访问
	Route.NoRoute(func(c *gin.Context) {
		c.String(404, "未知请求，请检查路径")
	})

	// !跨域请求
	Route.Use(middleware.CORSMiddleware)

	//!检测user-agent
	// Router.Use(middleware.ProcessingUserAgent)
}

func init() {
	Routing_Configuration()
	Route.Use(middleware.CORSMiddleware)
	Route.GET("/GetVerificationCode", router.GetVerificationCode)
	Route.GET("/GetPublicKey", router.GetPublicKey)
	Init := Route.Group("/Init") //^初始化
	{
		Init.POST("/Login", router.Login)
		Init.POST("/Register", router.Register)
	}
	User := Route.Group("/User", middleware.LoginAuthentication) //^用户
	{
		User.GET("/Info", router.GetUserInfo) //!获取用户信息
	}
	Artical := Route.Group("/Articles") //^文章
	{
		Artical.GET("/GetArticle/*ArticelId", router.Articles)                                   //!获取文章
		Artical.POST("/ArticlesLike", middleware.LoginAuthentication, router.ArticlesLike)       //!文章点赞
		Artical.POST("/ArticlesRelease", middleware.LoginAuthentication, router.ArticlesRelease) //!文章发布

	}
}
