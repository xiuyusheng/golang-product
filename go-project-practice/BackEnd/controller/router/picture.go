package router

import (
	"fmt"
	"jiaowu/model"
	"jiaowu/pkg"
	"jiaowu/util"
	"net/http"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
)

// ! 添加
func Add(c *gin.Context) {
	AttributableID, err1 := strconv.Atoi(c.PostForm("AttributableID"))
	if err1 != nil {
		c.JSON(200, gin.H{"code": 400, "Message": "学生ID出错"})
		c.Abort()
		return
	}
	var stu model.Student
	model.DB.Find(&stu, &model.Student{SID: AttributableID})
	if stu.SID == 0 {
		c.JSON(200, gin.H{"code": 400, "Message": "学生ID不存在"})
		c.Abort()
		return
	}
	var certificate model.Certificate
	model.DB.Find(&certificate, &model.Certificate{AttributableID: AttributableID})
	if certificate.AttributableID != 0 {
		c.JSON(200, gin.H{"code": 400, "Message": "该学生已上传证书"})
		c.Abort()
		return
	}
	file, err0 := c.FormFile("file")
	if err0 != nil {
		c.JSON(200, gin.H{"code": 400, "Message": "文件上传错误"})
		c.Abort()
		return
	}
	PathName := util.RandStr(10)
	ok, _ := util.PUT_COS(file, PathName)
	if ok {
		stu := model.Student{}
		CertificateID := int(time.Now().Unix())
		model.DB.Find(&stu, &model.Student{SID: AttributableID})
		var standardTime string = c.PostForm("IssuanceDate")
		//?格式转换
		standardTime = func() string {
			time_, _ := strconv.Atoi(standardTime)
			// 将本地时间转换为标准时间
			return time.Unix(int64(time_/1000), 0).Format("2006-01")
		}()
		var Certificate = model.Certificate{
			CertificateID:        CertificateID,
			AttributableID:       AttributableID,
			CreatTime:            time.Now(),
			IssuanceDate:         standardTime,
			CertificateLevel:     c.PostForm("CertificateLevel"),
			CertificateAuthority: c.PostForm("CertificateAuthority"),
			CertificateName:      c.PostForm("CertificateName"),
			IdentifyLocations:    c.PostForm("IdentifyLocations"),
			PictureByte:          fmt.Sprintf("%s/%s", pkg.Package.Cos.AppId, PathName),
			ClassID:              stu.ClassID,
		}
		model.DB.Create(&Certificate)
		model.DB.Model(model.Student{}).Where("SID=?", stu.SID).Update("CertificateID", CertificateID)
		c.JSON(200, gin.H{"code": 200, "Message": "文件上传成功"})
		c.Abort()
	} else {
		c.JSON(200, gin.H{"code": 400, "Message": "文件上传失败"})
		c.Abort()
		return
	}
}

// ! 删除
func Delete(c *gin.Context) {
	ID, err := strconv.Atoi(c.PostForm("AttributableID"))
	if err != nil {
		c.JSON(200, gin.H{"code": 400, "Message": "ID error"})
		c.Abort()
		return
	}
	var stu model.Student
	model.DB.Find(&stu, model.Student{SID: ID})
	if stu.SID == 0 {
		c.JSON(200, gin.H{"code": 400, "Message": "查无此学生"})
		c.Abort()
		return
	}

	var certificate model.Certificate
	model.DB.Find(&certificate, model.Certificate{AttributableID: ID})
	if certificate.CertificateID != 0 {
		fmt.Printf(certificate.PictureByte, certificate.AttributableID, certificate.CertificateAuthority)
		ok, err := util.Delete_Cos(certificate.PictureByte)
		if ok {
			model.DB.Where("AttributableID=?", certificate.AttributableID).Delete(&certificate)

			c.JSON(200, gin.H{"code": 200, "Message": "证书删除成功"})
			c.Next()
		} else {
			c.JSON(200, gin.H{"code": 400, "Message": "证书删除失败", "error": err.Error()})

		}
	} else {
		c.JSON(200, gin.H{"code": 400, "Message": "该生未上传证书"})
	}
}

// !分页查询
func PageQuery(c *gin.Context) {
	type page struct {
		PageNum   int `form:"page"`
		PageSize  int `form:"limit"`
		IsThrough int `form:"isthrough"`
		Grade     int `form:"grade"`
		DeptID    int `form:"deptid"`
		PID       int `form:"professionalid"`
		ClassID   int `form:"classid"`
		SID       int `form:"studentid"`
	}
	var pages page

	if c.ShouldBind(&pages) != nil {
		c.JSON(http.StatusUnauthorized, gin.H{
			"err_msg": "参数错误", "msg": pages,
		})
		return
	}
	if pages.PageNum <= 0 {
		pages.PageNum = 1
	}

	var where_to string = " ?=? "
	var where []interface{} = []interface{}{
		1, 1,
	}
	if pages.SID != 0 {
		where_to += " and student.SID LIKE ? "
		where = append(where, "%"+strconv.Itoa(pages.SID)+"%")
	} else if pages.ClassID != 0 {
		where_to += " and student.ClassID=? "
		where = append(where, strconv.Itoa(pages.ClassID))
	} else if pages.PID != 0 {
		where_to += " and student.PID=? "
		where = append(where, strconv.Itoa(pages.PID))
	} else if pages.DeptID != 0 {
		where_to += " and student.DeptID=? "
		where = append(where, strconv.Itoa(pages.DeptID))
	}
	var certificateAttID []int
	if pages.SID == 0 {
		switch c.PostForm("isthrough") {
		case "1": //待审核
			model.DB.Model(&model.Message{}).Select("CertificateAttID").Find(&certificateAttID)
			model.DB.Model(&model.Certificate{}).Select("AttributableID").Where("AttributableID NOT IN ?", certificateAttID).Find(&certificateAttID)
		case "2": //审核通过
			model.DB.Model(&model.Message{}).Select("CertificateAttID").Find(&certificateAttID)
			model.DB.Model(&model.Certificate{}).Select("AttributableID").Where("AttributableID IN ? and IsThrough=?", certificateAttID, false).Find(&certificateAttID)
		case "3": //审核不通过
			model.DB.Model(&model.Message{}).Select("CertificateAttID").Find(&certificateAttID)
			model.DB.Model(&model.Certificate{}).Select("AttributableID").Where("AttributableID IN ? and IsThrough=?", certificateAttID, true).Find(&certificateAttID)
		}
		if c.PostForm("isthrough") == "1" {
			where_to += " and certificate.AttributableID IN ?"
			where = append(where, certificateAttID)
		} else if c.PostForm("isthrough") == "2" || c.PostForm("isthrough") == "3" {
			var certificateAttID_ []int
			model.DB.Model(&model.Message{}).Select("CertificateAttID").Find(&certificateAttID_)

			if c.PostForm("isthrough") != "1" && len(certificateAttID) != 0 {
				where_to += " and certificate.AttributableID IN ? and certificate.AttributableID NOT IN ? "
				where = append(where, certificateAttID_, certificateAttID)

			} else {
				where_to += " and certificate.AttributableID IN ? "
				where = append(where, certificateAttID_)

			}

		}
	}
	type data struct {
		AttributableID       int       `form:"AttributableID"`
		CertificateAuthority string    `form:"CertificateAuthorityAuthor"`
		CertificateID        int       `form:"CertificateID"`
		CertificateLevel     string    `form:"CertificateLevel"`
		CertificateName      string    `form:"CertificateName"`
		ClassID              int       `form:"ClassID"`
		ClassName            string    `form:"ClassName"`
		CreatTime            time.Time `form:"CreatTime"`
		IdentifyLocations    string    `form:"IdentifyLocations"`
		IsThrough            bool      `form:"IsThrough"`
		Reviewed             int
		IssuanceDate         string `form:"IssuanceDate"`
		PictureByte          string `form:"PictureByte"`
		SName                string `form:"SName"`
		DeptName             string `form:"DeptName"`
		PName                string `form:"PName"`
		Grade                int    `form:"Grade"`
		Message              string `form:"Message"`
	}
	var datas []data
	var totle int64
	if err := model.DB.Model(model.Certificate{}).Select(`
	certificate.CertificateID,
	certificate.AttributableID,
	certificate.PictureByte,
	certificate.CreatTime,
	certificate.IssuanceDate,
	certificate.CertificateLevel,
	certificate.CertificateAuthority,
	certificate.ClassID,
	certificate.IsThrough,
	certificate.CertificateName,
	certificate.IdentifyLocations,
	student.SName,
	student.Grade,
	class.ClassName,
	dept.DeptName,
	professional.PName,
	message.DataText as Message
	`).Joins("LEFT JOIN student ON certificate.AttributableID=student.SID").Joins("LEFT JOIN class ON student.ClassID=class.ClassID").Order("CertificateID").Joins("LEFT JOIN dept ON dept.DeptID=student.DeptID").Joins("LEFT JOIN professional ON professional.PID=student.PID").Joins("LEFT JOIN  message ON message.CertificateAttID=certificate.AttributableID").Where(where_to, where...).Count(&totle).Offset((pages.PageNum - 1) * pages.PageSize).Limit(pages.PageSize).Find(&datas).Error; err != nil {
		c.JSON(200, gin.H{
			"code":    400,
			"Message": err.Error(),
		})
	} else {
		var Revieweds []int
		model.DB.Model(&model.Message{}).Select("CertificateAttID").Find(&Revieweds)
		for i, c := range datas {
			datas[i].Reviewed = 1
			for _, r := range Revieweds {
				if c.AttributableID == r {
					switch c.IsThrough {
					case true:
						datas[i].Reviewed = 2
					case false:
						datas[i].Reviewed = 3
					}
				}
			}
		}
		c.JSON(200, gin.H{
			"code":  200,
			"data":  datas,
			"totle": totle,
		})
	}
}

// ! 查询
func Query(c *gin.Context) {
	var params [][]string = [][]string{{"SID", "SID"}, {"CID", "ClassID"}, {"PID", "PID"}, {"DID", "DeptID"}}
	// var Certificate []model.Certificate
	var CertificateIDs []int
	var StuNames []string
	for index, value := range params {
		if len(c.PostForm(value[0])) != 0 {
			fmt.Println(c.PostForm(value[0]))
			model.DB.Model(model.Student{}).Order("SID").Select("CertificateID").Where(value[1]+" = ? and CertificateID IS NOT NULL", c.PostForm(value[0])).Pluck("CertificateID", &CertificateIDs)

			model.DB.Model(model.Student{}).Order("SID").Select("SName").Where(value[1]+" = ? and CertificateID IS NOT NULL", c.PostForm(value[0])).Pluck("SName", &StuNames)

			break
		} else if index == len(params)-1 {
			fmt.Println(CertificateIDs)
			model.DB.Model(model.Student{}).Order("SID").Select("CertificateID").Where(" CertificateID IS NOT NULL").Pluck("CertificateID", &CertificateIDs)
			model.DB.Model(model.Student{}).Order("SID").Select("SName").Where(" CertificateID IS NOT NULL").Pluck("SName", &StuNames)
			fmt.Println(CertificateIDs)

		}
	}

	type msg struct {
		CertificateID        int       `gorm:"column:CertificateID"`
		CerPath              string    `gorm:"column:PictureByte"`
		IssuanceDate         string    `gorm:"column:IssuanceDate"`
		CertificateLevel     string    `gorm:"column:CertificateLevel"`
		CertificateAuthority string    `gorm:"column:CertificateAuthority"`
		ClassName            string    `gorm:"column:ClassName"`
		CertificateName      string    `gorm:"column:CertificateName"`
		IdentifyLocations    string    `gorm:"column:IdentifyLocations"`
		AttributableID       int       `gorm:"column:AttributableID"`
		AttributableName     string    `gorm:"column:SName"`
		CreatTime            time.Time `gorm:"column:CreatTime"`
		IsThrough            bool      `gorm:"column:IsThrough"`
	}

	var msgs []msg
	model.DB.Model(model.Certificate{}).Select(
		`certificate.CertificateID,
	certificate.PictureByte,
	certificate.IssuanceDate,
	certificate.CertificateLevel,
	certificate.CertificateAuthority,
	certificate.CertificateName,
	certificate.IdentifyLocations,
	certificate.AttributableID,
	certificate.CreatTime,
	certificate.IsThrough,
	student.SName,
	class.ClassName
	`).Joins(
		`LEFT JOIN student ON student.SID=certificate.AttributableID 
	LEFT JOIN class ON class.ClassID=certificate.ClassID`).Order("certificate.AttributableID").Where("certificate.CertificateID IN (?)", CertificateIDs).Find(&msgs)
	if len(msgs) != 0 {
		c.JSON(200, gin.H{
			"code": 200, "data": msgs,
		})
	} else {
		c.JSON(200, gin.H{
			"code": 400, "Message": "无目标信息",
		})
	}
}

// !  审核
func Audit(c *gin.Context) {
	var IsThrough_str string = c.PostForm("IsThrough")
	if len(IsThrough_str) == 0 || (c.PostForm("IsThrough") != "True" && c.PostForm("IsThrough") != "False") {
		c.JSON(200, gin.H{
			"code": 400, "Message": "错误请求",
		})
		c.Abort()
		return
	}
	var IsThrough int
	if c.PostForm("IsThrough") == "True" {
		IsThrough = 1
	} else if c.PostForm("IsThrough") == "False" {
		IsThrough = 0
	}
	CertificateID := c.PostForm("CertificateID")
	var a model.Certificate
	aa := model.DB.Model(model.Certificate{}).Where("CertificateID=?", CertificateID)
	if aa.Find(&a); a.AttributableID == 0 {
		c.JSON(200, gin.H{"code": 400, "Message": "证书不存在"})
		c.Abort()
		return
	} else {
		aa.Update("IsThrough", IsThrough)

	}
	var certificate model.Certificate
	model.DB.Model(model.Certificate{}).Where("CertificateID=?", CertificateID).Find(&certificate)
	fmt.Println(certificate.IsThrough)
	if certificate.IsThrough {

		c.JSON(200, gin.H{
			"code": 200, "Message": fmt.Sprintf("(%s)设置通过", CertificateID),
		})
	} else {
		c.JSON(200, gin.H{
			"code": 200, "Message": fmt.Sprintf("(%s)取消通过", CertificateID),
		})
	}
	c.Set("certificate", certificate)
	c.Next()
}
