package router

import (
	"fmt"
	"jiaowu/model"
	"jiaowu/util"

	"github.com/gin-gonic/gin"
)

// 登录者身份信息查询
func StuOInfo(c *gin.Context) {
	auth, _ := c.Get("auth")
	fmt.Println(auth)
	auth_, ok := auth.(*util.MyCustomClaims)
	if !ok {
		c.String(200, "身份解析失败")
		c.Abort()
		return
	}

	if auth_.UserType == 0 {
		type msg_ struct {
			ID            int    `gorm:"column:AID"`
			LastLoginTime string `gorm:"column:LastLoginTime"`
			Unit          string `gorm:"column:DeptName"`
			Name          string `gorm:"column:AName"`
		}
		var admin msg_
		model.DB.Model(model.Admin{}).Select("admin.AID,admin.LastLoginTime,admin.AName,dept.DeptName").Joins("LEFT JOIN dept ON admin.DeptID=dept.DeptID").Where("AID=?", auth_.UserID).Find(&admin)
		c.JSON(200, gin.H{
			"code": 200, "data": admin,
		})
		c.Abort()
		return
	}
	type msg_ struct {
		ID            int    `gorm:"column:SOID"`
		LastLoginTime string `gorm:"column:LastLoginTime"`
		Unit          string `gorm:"column:ClassName"`
		Name          string `gorm:"column:SName"`
	}
	var admin msg_
	model.DB.Model(model.Studyone{}).Select("studyone.SOID,studyone.LastLoginTime,student.SName,class.ClassName").Joins("LEFT JOIN class ON class.ClassID=studyone.ClassID LEFT JOIN student ON student.SID=studyone.SOID").Where("studyone.SOID=?", auth_.UserID).Find(&admin)
	c.JSON(200, gin.H{
		"code": 200, "data": admin,
	})
}

// 班级区域划分
func AreaInfo(c *gin.Context) {
	type class struct {
		// gorm.Model
		PID       int    `gorm:"column:PID"`
		ClassName string `gorm:"column:ClassName"`
		ClassID   int    `gorm:"column:ClassID"`
	}
	type professional struct {
		// gorm.Model
		DID              int     `gorm:"column:DeptID"`
		ProfessionalName string  `gorm:"column:PName"`
		ProfessionalID   int     `gorm:"column:PID"`
		Classes          []class `gorm:"foreignKey:PID;references:ProfessionalID;"`
	}
	type dept struct {
		// gorm.Model
		DeptName      string         `gorm:"column:DeptName"`
		DeptID        int            `gorm:"column:DeptID"`
		Professionals []professional `gorm:"foreignKey:DID;references:DeptID;"`
		GID           int            `gorm:"column:Grade"`
	}
	type grade struct {
		Grade int    `gorm:"column:Grade"`
		Depts []dept `gorm:"foreignKey:GID;references:Grade;"`
	}
	var datas []grade

	result := model.DB.Table("class").
		Select("class.ClassID, class.ClassName, class.DeptID, dept.DeptName,dept.Grade, class.PID, professional.PName").
		Joins("JOIN dept ON dept.DeptID = class.DeptID").
		Joins("JOIN professional ON professional.PID = class.PID").Preload("Depts").Preload("Depts.Professionals").Preload("Depts.Professionals.Classes").Find(&datas)

	if result.Error != nil {
		// 处理查询错误
		c.JSON(500, gin.H{"error": result.Error.Error()})
	} else {
		// 返回JSON响应
		for i := 0; i < len(datas)-1; i++ {
			if datas[i].Grade == datas[i+1].Grade {
				datas = append(datas[:i], datas[i+1:]...) //删除重复元素
				i--
			}
		}
		c.JSON(200, gin.H{"code": 200, "data": datas})
	}

}

// 获取学委上传时的提示信息
func PromptInfo(c *gin.Context) {
	var msgs []model.Cerclas
	db := model.DB.Raw("SELECT CertificateName,CertificationAuthority FROM `cerclas`").Find(&msgs)
	if db.Error != nil {
		c.JSON(200, gin.H{"code": 400, "Message": db.Error})

	} else {
		c.JSON(200, gin.H{"code": 200, "data": msgs})
	}
}

// 获取所有学生信息
func QueryStus(c *gin.Context) {
	type page struct {
		PageNum  int    `form:"page"`
		PageSize int    `form:"limit"`
		SName    string `form:"sname"`
	}
	var pages page
	if c.Bind(&pages) != nil {
		c.JSON(200, gin.H{
			"err_msg": "参数错误", "msg": pages,
		})
		c.Abort()
		return
	}
	if pages.PageNum < 1 {
		pages.PageNum = 1
	}
	var where string = "1=1 "
	if pages.SName != "" {
		where = "student.SName LIKE '%" + pages.SName + "%' "
	}
	type stus struct {
		SID       int    `gorm:"column:SID"`
		SName     string `gorm:"column:SName"`
		ClassName string `gorm:"column:ClassName"`
		ClassID   int    `gorm:"column:ClassID"`
		IsSO      bool
	}
	var stuss []stus
	var totle int64
	if model.DB.Model(&model.Student{}).Select("student.SID,student.SName,class.ClassID,class.ClassName").Joins("LEFT JOIN class ON student.ClassID=class.ClassID").Where(where).Count(&totle).Offset((pages.PageNum-1)*pages.PageSize).Limit(pages.PageSize).Find(&stuss).Error != nil {
		c.JSON(200, gin.H{"code": 400, "Message": "error"})
	} else {

		var sos []int
		model.DB.Model(&model.Studyone{}).Select("SOID").Find(&sos)
		for _, s := range sos {
			for i, c := range stuss {
				if c.SID == s {
					stuss[i].IsSO = true
				}
			}
		}
		c.JSON(200, gin.H{"code": 200, "data": stuss, "totle": totle})
	}
}

func OSGetStu(c *gin.Context) {
	auth, _ := c.Get("auth")
	auth_, ok := auth.(*util.MyCustomClaims)
	if !ok {
		c.JSON(200, gin.H{
			"code": 400, "Message": "身份错误",
		})

		c.Abort()
		return
	}
	type stu struct {
		SID   int    `gorm:"column:SID"`
		SName string `gorm:"column:SName"`
	}
	var stus []stu
	if model.DB.Model(&model.Student{}).Select("SID,SName").Where("ClassID=(SELECT ClassID FROM studyone WHERE SOID=?) and SID NOT IN (SELECT AttributableID FROM certificate )", auth_.UserID).Find(&stus).Error != nil {
		c.JSON(200, gin.H{
			"code": 400, "Message": "查询失败",
		})
	} else {
		c.JSON(200, gin.H{
			"code": 200, "data": stus,
		})
	}

}
