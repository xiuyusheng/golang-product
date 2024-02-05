package router

import (
	"QuestionnaireSurvey/model"
	"QuestionnaireSurvey/util"
	"fmt"
	"regexp"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
)

func Articles(c *gin.Context) { //^文章查询
	ArticalId := c.Param("ArticleId")
	ok, _ := regexp.MatchString(`^/\d+$`, ArticalId)
	fmt.Println(ArticalId[1:], ok)
	type Message struct {
		Id             string    `gorm:"column:ArticleID"`
		Title          string    `gorm:"column:Title"`
		Author         string    `gorm:"column:AuthorID"`
		Content        string    `gorm:"column:Content"`
		Contentpreview string    `gorm:"column:ContentPreview"`
		Watchsum       int       `gorm:"column:ViewSum"`
		Likesum        int       `gorm:"column:Likesum"`
		Createdat      time.Time `gorm:"column:CreatedAt"`
		Updatedat      time.Time `gorm:"column:UpdatedAt"`
		IsLike         bool      `gorm:"column:IsLike"`
	}
	if ok {
		var data Message
		article := model.DB.Model(model.Articles{}).Select("articles.ArticleID,articles.Title,articles.AuthorID,articles.Content,articles.ContentPreview,articles.ViewSum,articles.CreatedAt,articles.UpdatedAt").Joins("RIGHT JOIN likes ON likes.ArticleID=articles.ArticleID").Where("articles.ArticleID=?", ArticalId[1:]).Find(&data)
		fmt.Println(article)
		// IsLike := model.DB.Model(model.Likes{}).Find()
		if data.Id == "" {
			c.JSON(200, gin.H{"code": 200, "data": nil})
		} else {
			c.JSON(200, gin.H{"code": 200, "data": data})
			article.Update("ViewSum", data.Watchsum+1)
		}

	} else {
		var datas []Message
		model.DB.Model(model.Articles{}).Select("ArticleID,Title,AuthorID,Content,ViewSum,CreatedAt,UpdatedAt").Find(&datas)
		c.JSON(200, gin.H{"code": 200, "data": datas})
	}
}

func ArticlesLike(c *gin.Context) { //^文章点赞
	User_data, _ := c.Get("User")
	user := User_data.(*util.MyCustomClaims)
	type article struct {
		ArticleID string `json:"ArticleID"`
	}
	var article_ article
	c.BindJSON(&article_)
	if article_.ArticleID == "" {
		c.JSON(200, gin.H{"code": 400, "message": "缺少文章id"})
		c.Abort()
		return
	}
	var article_data model.Articles
	if model.DB.Model(model.Articles{}).Where("ArticleID=?", article_.ArticleID).Find(&article_data); article_data.ArticleID == "" {
		c.JSON(200, gin.H{"code": 400, "message": "未查询到文章"})
		c.Abort()
		return
	}
	var like model.Likes
	db := model.DB.Model(model.Likes{})
	db.Where("UserID=? AND ArticleID=?", user.UserID, article_.ArticleID).Find(&like)
	if like.ArticleID == "" {
		db.Create(model.Likes{
			UserID:    user.UserID,
			ArticleID: article_.ArticleID,
		})
		c.JSON(200, gin.H{
			"code":    200,
			"message": "点赞成功",
		})
	} else {
		db.Delete(like, "UserID=? and ArticleID=?", user.UserID, article_.ArticleID)
		c.JSON(200, gin.H{
			"code":    200,
			"message": "取消点赞成功",
		})
	}
}

func ArticlesRelease(c *gin.Context) { //^文章发布
	type ArticleData struct {
		Title          string `json:"title"`
		Author         string `josn:"author"`
		Content        string `json:"content"`
		Contentpreview string `json:"contentpreview"`
	}
	var articledata ArticleData
	if err := c.BindJSON(&articledata); err != nil {
		c.JSON(200, gin.H{
			"code":    400,
			"message": "参数解析错误",
		})
		c.Abort()
		return
	}
	User_data, _ := c.Get("User")
	user := User_data.(*util.MyCustomClaims)
	if db := model.DB.Model(model.Articles{}).Create(&model.Articles{
		ArticleID:      strconv.Itoa(util.Random.Int()),
		Title:          articledata.Title,
		AuthorID:       user.UserID,
		Content:        articledata.Content,
		ContentPreview: articledata.Contentpreview,
	}); db.Error != nil {
		c.JSON(200, gin.H{
			"code":    400,
			"message": "上传失败",
		})
		c.Abort()
		return
	}
	c.JSON(200, gin.H{
		"code":    200,
		"message": "上传成功",
	})
}
