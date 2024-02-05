package model

import "time"

type User struct { //^用户模型
	UserID   string `gorm:"column:UserID"`
	UserName string `gorm:"column:UserName"`
	Password string `gorm:"column:Password"`
	Email    string `gorm:"column:Email"`
	Sex      int    `gorm:"column:Sex"`
	Identity int    `gorm:"column:Identity"`
	IsEnable bool   `gorm:"column:IsEnable"`
}

type Articles struct { //^文章模型
	ArticleID      string    `gorm:"column:ArticleID"`
	Title          string    `gorm:"column:Title"`
	AuthorID       string    `gorm:"column:AuthorID"`
	Content        string    `gorm:"column:Content"`
	ContentPreview string    `gorm:"column:ContentPreview"`
	ViewSum        int       `gorm:"column:ViewSum"`
	CreatedAt      time.Time `gorm:"column:CreatedAt"`
	UpdatedAt      time.Time `gorm:"column:UpdatedAt"`
}

type Likes struct { //^点赞列表
	UserID    string `gorm:"column:UserID"`
	ArticleID string `gorm:"column:ArticleID"`
}
