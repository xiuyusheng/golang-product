package router

import (
	"fmt"
	"jiaowu/model"
	"jiaowu/util"
	"time"

	"github.com/gin-gonic/gin"
)

// ?通知上传
func Put_Msg(c *gin.Context) {
	var text string
	if c.PostForm("DataText") == "" {
		if c.PostForm("IsThrough") == "True" {
			text = "已通过"
		} else {
			text = "不通过"
		}
	} else {
		text = c.PostForm("DataText")
	}
	auth, _ := c.Get("auth")
	auth_ := auth.(*util.MyCustomClaims)
	var msg model.Message

	CertificateID := c.PostForm("CertificateID")
	model.DB.Model(model.Certificate{}).Select("AttributableID as CertificateAttID ,ClassID").Where("CertificateID=?", CertificateID).Find(&msg)
	fmt.Println(msg.ClassID)
	resu := model.DB.Where("CertificateAttID=?", msg.CertificateAttID)
	if resu.Error == nil {
		model.DB.Model(model.Message{}).Delete(&model.Message{}, "CertificateAttID=?", msg.CertificateAttID)
	}
	msg.MID = int(time.Now().Unix())
	msg.CreatTime = time.Now()
	msg.SendAttrID = auth_.UserID
	msg.DataText = text
	model.DB.Model(model.Message{}).Create(&msg)
}

// ?通知查询
func Query_Msg(c *gin.Context) {
	auth, _ := c.Get("auth")
	auth_, ok := auth.(*util.MyCustomClaims)
	if !ok {
		c.JSON(200, gin.H{"code": 400, "Message": "身份错误（Query_Msg）"})
		c.Abort()
		return
	}
	ID := auth_.UserID

	var msga model.Message
	if auth_.UserType == 1 {
		var classid int
		model.DB.Model(model.Studyone{}).Select("ClassID").Where("SOID=?", ID).Pluck("ClassID", &classid)
		msga = model.Message{ClassID: classid}
	} else {
		msga = model.Message{SendAttrID: ID}

	}
	type msgs struct {
		CertificateAttID int
		SName            string
		MID              int
		DataText         string
		IsThrough        bool
		CreatTime        time.Time
		ClassName        string
	}
	var msg []msgs
	model.DB.Model(model.Message{}).Select("message.CertificateAttID,certificate.IsThrough,message.MID,message.DataText,message.CreatTime,student.SName,class.ClassName").Joins(`
	LEFT JOIN student ON student.SID=message.CertificateAttID
	LEFT JOIN class ON student.ClassID=class.ClassID
	LEFT JOIN certificate ON student.CertificateID=certificate.CertificateID
	`).Order("ClassName").Find(&msg, &msga)
	c.JSON(200, gin.H{"code": 200, "data": msg})
}
