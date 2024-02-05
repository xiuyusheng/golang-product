package controller

import (
	"jiaowu/controller/middleware"
	"jiaowu/controller/router"
	"jiaowu/pkg"

	"github.com/gin-gonic/gin"
)

var Router *gin.Engine

// ?配置
func Routing_Configuration() {
	//!路由日志
	middleware.InitLogger(&pkg.Package.LogConfig) //初始化日志配置
	Router.Use(middleware.GinLogger)

	//!错误恢复
	// Router.Use(gin.Recovery())

	//!未知访问
	Router.NoRoute(func(c *gin.Context) {
		c.String(404, "未知请求，请检查路径")
	})

	// !跨域请求
	Router.Use(middleware.CORSMiddleware)
	// Router.Use(cors.Default())

	//!检测user-agent
	Router.Use(middleware.ProcessingUserAgent)
}

func init() {
	//正式发布
	gin.SetMode(gin.ReleaseMode)
	//hello
	//^创建路由
	Router = gin.Default()

	//*配置路由
	Routing_Configuration()

	//!excel文件生成测试
	Router.GET("/Export", router.CreateExcel)

	//?学委管理员登录
	Router.POST("/Login", router.Login)

	//?学生证书管理
	options := Router.Group("/Picture").Use(middleware.Auth)
	{
		// 证书上传
		options.POST("/Add", middleware.IsStu, middleware.Evaluation, middleware.Alibration, router.Add)
		// 证书删除
		options.POST("/Delete", middleware.Alibration, router.Delete)
		// 证书查询
		options.POST("/Query", router.Query)
		// 证书统计导出
		options.POST("/Export", middleware.IsTea, router.CreateExcel)
		//证书审核
		options.POST("/Audit", middleware.IsTea, middleware.Audit, router.Audit, router.Put_Msg)
		//分页查询
		options.POST("/Paging", router.PageQuery)
	}

	//?学委接收通知
	msgopt := Router.Group("/Message").Use(middleware.Auth)
	{
		//添加通知
		msgopt.POST("/Add", middleware.IsTea, router.Put_Msg)
		//查看通知
		msgopt.POST("/Query", router.Query_Msg)
	}

	//?学委管理
	studyone := Router.Group("/Studyone").Use(middleware.Auth, middleware.IsTea)
	{
		//禁用
		studyone.POST("/SO", router.SOManager)
		//添加
		studyone.POST("/AddSO", router.AddSO)
		//删除
		studyone.POST("/DelSO", router.DelSO)
		//查询
		studyone.POST("/QuerySO", router.QuerySO)
		//修改
		studyone.POST("/UpdateSO", router.UpdatePWSO)
	}

	//?获取信息
	info := Router.Group("/Info").Use(middleware.Auth)
	{
		//学委个人信息
		info.POST("/MySelf", router.StuOInfo)
		//所有班级信息
		info.POST("/Area", router.AreaInfo)
		//返回所有学生信息
		info.POST("/QueryStu", middleware.IsTea, router.QueryStus)
		//查询学委所在班级学生信息
		info.POST("/QueryOSGetStu", router.OSGetStu)
		//返回学委上传信息时提示的信息
		info.POST("/Prompt", router.PromptInfo)
	}

	//?学生管理
	student := Router.Group("/Student").Use(middleware.Auth)
	{
		//添加学生
		student.POST("/AddStu", middleware.IsTea, router.AddStu)
		//删除学生
		student.POST("/DelStu", middleware.IsTea, router.DelStu)
	}

}
