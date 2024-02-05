package model

import (
	"time"
)

// ?上传提示信息
type Cerclas struct {
	CertificateName        string `gorm:"column:CertificateName"`
	CertificationAuthority string `gorm:"column:CertificationAuthority"`
	CertificateLevel       string `gorm:"column:CertificateLevel"`
}

// ? 学委
type Studyone struct {
	SOID          int       `gorm:"column:SOID;primary_key;type:int"`
	SPassword     string    `gorm:"column:SPassword;type:varchar"`
	LastLoginTime time.Time `gorm:"column:LastLoginTime;type:datetime"`
	ClassID       int       `gorm:"column:ClassID;type:int"`
	IsEnable      bool      `gorm:"column:IsEnable"`
}

// ? 证书
type Certificate struct {
	CertificateID        int       `gorm:"column:CertificateID;type:int"`
	AttributableID       int       `gorm:"column:AttributableID;type:int"`
	IsThrough            bool      `gorm:"column:IsThrough;Default:false;type:bit"`
	PictureByte          string    `gorm:"column:PictureByte;type:varchar"`
	CreatTime            time.Time `gorm:"column:CreatTime;type:datetime"`
	IssuanceDate         string    `gorm:"column:IssuanceDate;type:varchar"`
	CertificateLevel     string    `gorm:"column:CertificateLevel;type:varchar"`
	CertificateAuthority string    `gorm:"column:CertificateAuthority;type:varchar"`
	ClassID              int       `gorm:"column:ClassID;type:int"`
	CertificateName      string    `gorm:"column:CertificateName;type:varchar"`
	IdentifyLocations    string    `gorm:"column:IdentifyLocations;type:varchar"`
}

// ? 学生
type Student struct {
	SID           int    `gorm:"column:SID"`
	SName         string `gorm:"column:SName"`
	SSex          bool   `gorm:"column:SSex;default:1"`
	ClassID       int    `gorm:"column:ClassID"`
	DeptID        int    `gorm:"column:DeptID"`
	CertificateID int    `gorm:"column:CertificateID"`
	PID           int    `gorm:"column:PID"`
}

// ?学院
type Dept struct {
	DeptID     int    `gorm:"column:DeptID"`
	DeptName   string `gorm:"column:DeptName"`
	IsComplete bool   `gorm:"column:IsComplete"`
	Grade      int    `gorm:"column:Grade"`
}

// ? 管理员（教师）
type Admin struct {
	AID           int    `gorm:"column:AID"`
	Apassword     string `gorm:"column:Apassword"`
	LastLoginTime string `gorm:"column:LastLoginTime"`
	DeptID        int    `gorm:"column:DeptID"`
	AName         string `gorm:"column:AName"`
}

// ? 班级
type Class struct {
	ClassID   int    `gorm:"column:ClassID"`
	ClassName string `gorm:"column:ClassName"`
	DeptID    int    `gorm:"column:DeptID"`
	StuNum    int    `gorm:"column:StuNum"`
	UploadNum int    `gorm:"column:UploadNum"`
	IsThrough bool   `gorm:"column:IsThrough"`
	SOID      int    `gorm:"column:SOID"`
	PID       int    `gorm:"column:PID"`
}

// ? 改错消息
type Message struct {
	MID              int       `gorm:"column:MID"`
	CreatTime        time.Time `gorm:"column:CreatTime"`
	ClassID          int       `gorm:"column:ClassID"`
	DataText         string    `gorm:"column:DataText"`
	CertificateAttID string    `gorm:"column:CertificateAttID"`
	SendAttrID       int       `gorm:"column:SendAttrID"`
}

// ?专业
type Professional struct {
	PID   int    `gorm:"column:PID"`
	PName string `gorm:"column:PName"`
}
