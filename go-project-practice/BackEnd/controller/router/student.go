package router

import (
	"fmt"
	"jiaowu/model"
	"strconv"

	"github.com/gin-gonic/gin"
)

// !学生添加
func AddStu(c *gin.Context) {
	//!检查是否带有需求参数
	var params []string = []string{"SID", "SName", "ClassID"}
	for _, s := range params {
		if c.PostForm(s) == "" {
			c.JSON(200, gin.H{
				"code": 400, "Message": fmt.Sprintf("Lack of parameter(%s)", s),
			})
			c.Abort()
			return
		}
	}
	//!参数格式化
	var SID, ClassID int
	var err error
	var SName string = c.PostForm("SName")
	SID, err = strconv.Atoi(c.PostForm("SID"))
	if err != nil {
		c.JSON(200, gin.H{
			"code": 400, "Message": "Parameter(SID) error",
		})
		c.Abort()
		return
	}
	//!检查是否存在
	var stuT model.Student
	model.DB.Model(model.Student{}).Where("SID=?", SID).Take(&stuT)
	if stuT.SID != 0 {
		c.JSON(200, gin.H{
			"code": 400, "Message": "学生已存在",
		})
		c.Abort()
		return
	}
	ClassID, err = strconv.Atoi(c.PostForm("ClassID"))
	if err != nil {
		c.JSON(200, gin.H{
			"code": 400, "Message": "Parameter(ClassID) error",
		})
		c.Abort()
		return
	}
	//!提取班级信息
	type results struct {
		DeptID int `gorm:"DeptID"`
		PID    int `gorm:"PID"`
	}
	var res results
	model.DB.Model(model.Class{}).Select("DeptID,PID").Where("ClassID=?", ClassID).Find(&res)
	var stu model.Student = model.Student{
		SID:     SID,
		SName:   SName,
		ClassID: ClassID,
		DeptID:  res.DeptID,
		PID:     res.PID}
	ress := model.DB.Model(model.Student{}).Create(&stu)
	if ress.Error != nil {
		c.JSON(200, gin.H{
			"code": 400, "Message": "Add failure",
		})
		c.Abort()
		return
	}
	c.JSON(200, gin.H{
		"code": 200, "Message": "Add successful",
	})

}

// !学生删除
func DelStu(c *gin.Context) {
	//!检查是否带有需求参数
	var params []string = []string{"SID"}
	for _, s := range params {
		if c.PostForm(s) == "" {
			c.JSON(200, gin.H{
				"code": 400, "Message": fmt.Sprintf("Lack of parameter(%s)", s),
			})
			c.Abort()
			return
		}
	}

	//!参数格式化
	SID, err := strconv.Atoi(c.PostForm("SID"))
	if err != nil {
		c.JSON(200, gin.H{
			"code": 400, "Message": "SID error",
		})
		c.Abort()
		return
	}
	//!检查是否存在
	var stuT model.Student
	model.DB.Model(model.Student{}).Where("SID=?", SID).Take(&stuT)
	if stuT.SID == 0 {
		c.JSON(200, gin.H{
			"code": 400, "Message": "学生不存在",
		})
		c.Abort()
		return
	}
	res := model.DB.Model(model.Student{}).Delete(&model.Student{}, "SID=?", SID)
	if res.Error != nil {
		c.JSON(200, gin.H{
			"code": 400, "Message": "DELETE failure",
		})
		c.Abort()
		return
	}
	c.JSON(200, gin.H{
		"code": 200, "Message": "DELETE successful",
	})
}

// !学生查询
func QueryStu(c *gin.Context) {
	type stuu struct {
		SID       int    `json:"SID"`
		SName     string `json:"SName"`
		ClassName string `json:"ClassName"`
	}
	var stu []stuu
	model.DB.Model(model.Student{}).Select("student.SID,student.SName,Class.ClassName").Joins("JOIN Class ON student.ClassID=Class.ClassID").Find(&stu)
	c.JSON(200, gin.H{
		"code": 200, "data": stu,
	})
}
