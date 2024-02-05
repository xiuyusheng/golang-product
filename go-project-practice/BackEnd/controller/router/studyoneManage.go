package router

import (
	"jiaowu/model"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

// ! 删除学委
func DelSO(c *gin.Context) {
	//!检查是否带有需求参数
	var params []string = []string{"SOID"}
	for _, s := range params {
		if c.PostForm(s) == "" {
			c.JSON(200, gin.H{
				"code": 400, "Message": "Lack of parameter",
			})
			c.Abort()
			return
		}
	}

	//!检查格式是否正确（能否转型）
	SOID, err1 := strconv.Atoi(c.PostForm("SOID"))
	if err1 != nil {
		c.JSON(200, gin.H{
			"code": 400, "Message": "Invalid SOID",
		})
		c.Abort()
		return
	}
	//!删除数据库数据
	res := model.DB.Model(model.Studyone{}).Delete(model.Studyone{}, "SOID=?", SOID)
	if res.Error != nil || res.RowsAffected == 0 {
		c.JSON(200, gin.H{
			"code": 400, "Message": "Delete Failure",
		})
		c.Abort()
		return
	}
	c.JSON(200, gin.H{
		"code": 200, "Message": "Delete Successful",
	})
}

func in(target string, str_array []string) bool {
	for _, element := range str_array {
		if target == element {
			return true
		}
	}
	return false
}

// !修改学委密码
func UpdatePWSO(c *gin.Context) {
	var keys []string = []string{"SOID", "SPassword"}
	for k := range c.Request.PostForm {
		if !in(k, keys) {
			c.JSON(200, gin.H{
				"code": 400, "Message": "参数缺失",
			})
			c.Abort()
			return
		}
	}
	SOID, err := strconv.Atoi(c.PostForm("SOID"))
	if err != nil {
		c.JSON(200, gin.H{
			"code": 400, "Message": "SOID is not a valid",
		})
		c.Abort()
		return
	}
	result := model.DB.Model(model.Studyone{}).Where("SOID=?", SOID).Updates(model.Studyone{SPassword: c.PostForm("SPassword")})
	if result.RowsAffected == 1 {
		c.JSON(200, gin.H{"code": 200, "Message": "更新成功"})
		c.Abort()
		return
	}
	c.JSON(200, gin.H{"code": 400, "Message": "更新失败"})

}

// !查询学委
func QuerySO(c *gin.Context) {
	type stuuo struct {
		SOID          int       `gorm:"SOID"`
		SName         string    `gorm:"SName"`
		SPassword     string    `gorm:"SPassword"`
		LastLoginTime time.Time `gorm:"LastLoginTime"`
		ClassName     string    `gorm:"ClassName"`
		IsEnable      bool      `gorm:"IsEnable"`
	}
	var stuos []stuuo
	model.DB.Model(model.Studyone{}).Select("studyone.SOID", "student.SName", "studyone.SPassword", "studyone.LastLoginTime", "class.ClassName", "studyone.IsEnable").Joins("JOIN class ON studyone.ClassID = class.ClassID").Joins("LEFT JOIN student ON student.SID=studyone.SOID").Find(&stuos)
	c.JSON(200, gin.H{
		"code": 200, "data": stuos,
	})
}

// ! 添加学委
func AddSO(c *gin.Context) {
	//!检查是否带有需求参数
	var params []string = []string{"SOID", "ClassID", "SPassword"}
	for _, s := range params {
		if c.PostForm(s) == "" {
			c.JSON(200, gin.H{
				"code": 400, "Message": "Lack of parameter",
			})
			c.Abort()
			return
		}
	}
	//!检查格式是否正确（能否转型）
	SOID, err1 := strconv.Atoi(c.PostForm("SOID"))
	if err1 != nil {
		c.JSON(200, gin.H{
			"code": 400, "Message": "Invalid SOID",
		})
		c.Abort()
		return
	}
	ClassID, err2 := strconv.Atoi(c.PostForm("ClassID"))
	if err2 != nil {
		c.JSON(200, gin.H{
			"code": 400, "Message": "Invalid ClassID",
		})
		c.Abort()
		return
	}
	var res *gorm.DB
	//!检查受否在一个班级内
	var stu model.Student
	model.DB.Model(model.Student{}).Where("SID=? and ClassID=?", SOID, ClassID).Find(&stu)
	if stu.SID == 0 {
		c.JSON(200, gin.H{
			"code": 400, "Message": "学生和班级不符合！",
		})
		c.Abort()
		return
	}
	//!检查是否已经存在
	if model.DB.Model(model.Studyone{}).Where("SOID=?", SOID).Find(&model.Studyone{}).RowsAffected != 0 {
		c.JSON(200, gin.H{
			"code": 400, "Message": "该学生已存在学委列表中",
		})
		c.Abort()
		return
	}
	//!创建数据
	res = model.DB.Model(model.Studyone{}).Create(model.Studyone{
		SOID:          SOID,
		ClassID:       ClassID,
		SPassword:     c.PostForm("SPassword"),
		LastLoginTime: time.Now(),
		IsEnable:      true,
	})

	if res.Error != nil {
		c.JSON(200, gin.H{
			"code": 400, "Message": "Add Failure",
		})
		c.Abort()
		return
	}
	model.DB.Model(model.Class{}).Where("ClassID=?", ClassID).Update("SOID", SOID)
	c.JSON(200, gin.H{
		"code": 200, "Message": "Add Successful",
	})
}

// ! 禁用学委
func SOManager(c *gin.Context) {
	//!检查是否带有需求参数
	if (c.PostForm("ShutDown") != "True" && c.PostForm("ShutDown") != "False") || c.PostForm("SOID") == "" {
		c.JSON(200, gin.H{
			"code": 400, "Message": "Lack of parameter",
		})
		c.Abort()
		return
	}
	//!是否启用决策
	var IsEnable bool
	switch c.PostForm("ShutDown") {
	case "True":
		IsEnable = true
	case "False":
		IsEnable = false
	}
	//!修改数据表
	result := model.DB.Model(model.Studyone{}).Where("SOID = ?", c.PostForm("SOID")).Update("IsEnable", IsEnable)
	if result.Error != nil || result.RowsAffected == 0 {
		c.JSON(200, gin.H{
			"code": 400, "Message": "Could not update",
		})
		c.Abort()
		return
	}
	c.JSON(200, gin.H{"code": 200, "Message": "Ok!"})

}
