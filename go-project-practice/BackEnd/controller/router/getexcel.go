package router

import (
	"fmt"
	"jiaowu/model"
	"jiaowu/util"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/xuri/excelize/v2"
	"gorm.io/gorm"
)

func cl(c *gin.Context, fileName string, file *excelize.File) {
	c.Writer.Header().Add("Content-Type", "application/octet-stream")             //!浏览器并不认得这是什么类型，也不知道应该如何展示，只知道这是一种二进制文件，因此遇到content-type为application/octet-stream的文件时，浏览器会直接把它下载下来
	c.Writer.Header().Add("Content-disposition", "attachment;filename="+fileName) //!该响应头指示回复的内容该以何种形式展示，是以内联的形式（即网页或者页面的一部分），还是以附件的形式下载并保存到本地,这里是附件的形式
	c.Writer.Header().Add("Content-Transfer-Encoding", "binary")                  //!告诉浏览器，可能不止包含非ASCII字符，还可能不是一个短行（超过1000字符）
	file.Write(c.Writer)                                                          //!写入响应体中
}

func CreateExcel(c *gin.Context) {
	var wheres []string = []string{"ClassID", "PID", "DeptID"}
	var conditions string = "1=1"
	var fileName string
	now := time.Now()
	YMD := fmt.Sprintf("%d-%d-%d", now.Year(), int(now.Month()), now.Day())
	//!分类
	for index, where := range wheres {
		if len(c.PostForm(where)) != 0 {
			conditions = conditions + fmt.Sprintf(" and %s=%s", where, c.PostForm(where))
			ID, _ := strconv.Atoi(c.PostForm(where))
			switch where {
			case "ClassID":
				mod := model.Class{}
				model.DB.Where(where+" = ?", ID).Find(&mod)
				fileName = mod.ClassName + "统计表（" + YMD + "）.xlsx"

			case "PID":
				mod := model.Professional{}
				model.DB.Where(where+" = ?", ID).Find(&mod)
				fileName = mod.PName + "统计表（" + YMD + "）.xlsx"

			case "DeptID":
				mod := model.Dept{}
				model.DB.Where(where+" = ?", ID).Find(&mod)
				fileName = mod.DeptName + "统计表（" + YMD + "）.xlsx"

			}
			break
		} else if index == len(wheres)-1 {
			fileName = "所有学生统计表（" + YMD + "）.xlsx"
		}

	}

	//!是否已上传
	uploaded := c.PostForm("upload")
	switch uploaded {
	case "1":
		conditions = conditions + " and CertificateID IS NOT NULL"
	case "0":
		conditions = conditions + " and CertificateID IS NULL"
	}

	var stus []model.Student
	switch conditions {
	case "1+1":
		model.DB.Order("SID").Find(&stus)

	default:
		model.DB.Order("SID").Where(conditions).Find(&stus)

	}
	//!时间

	var db *gorm.DB = model.DB
	if c.PostForm("StartTime") != "" {
		TimeStamp, _ := strconv.ParseInt(c.PostForm("StartTime"), 10, 64)
		db = db.Where("CreatTime > ?", time.Unix(TimeStamp, 0))
	}
	if c.PostForm("EndTime") != "" {
		TimeStamp, _ := strconv.ParseInt(c.PostForm("EndTime"), 10, 64)
		db = db.Where("CreatTime < ?", time.Unix(TimeStamp, 0))
	}
	if c.PostForm("StartTime") != "" || c.PostForm("EndTime") != "" {
		var stuss []model.Student
		var Certificate []model.Certificate
		db.Model(model.Certificate{}).Order("AttributableID").Find(&Certificate)
		for _, c := range stus {
			for _, value := range Certificate {
				if c.SID == value.AttributableID {
					stuss = append(stuss, c)
				}

			}
		}
		stus = stuss

	}

	cl(c, fileName, util.WriteExcel("统计表", stus))

}
