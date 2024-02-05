package router

import (
	"QuestionnaireSurvey/model"
	"QuestionnaireSurvey/util"
	"fmt"
	"net/http"
	"regexp"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
)

// ^ 获取验证码
func GetVerificationCode(c *gin.Context) {
	key := fmt.Sprintf("VerificationCode-%s", c.PostForm("Email")) //!缓存键值
	expire, err := model.RDB.TTL(key).Result()                     //!获取剩余时间
	if err != nil {
		c.JSON(200, gin.H{
			"code":    http.StatusBadRequest,
			"message": "发送失败",
		})
		c.Abort()
		return
	}
	if 0 < expire && time.Duration(2)*time.Minute < expire {
		c.JSON(200, gin.H{
			"code":    http.StatusBadRequest,
			"message": "请勿频繁发送",
		})
		c.Abort()
		return
	}
	VerificationCode := util.RandStr(6, util.LettersUppercase)
	if email, _ := regexp.MatchString(`^[\d|\w]+@[\d|\w]+\.[\d|\w]+$`, c.PostForm("Email")); email {
		err := util.Email([]string{c.PostForm("Email")}, []string{"3044639452@qq.com"}, "问卷矩阵【验证码】", []byte(VerificationCode), nil, "") //!发送邮件,验证身份
		if err != nil {
			c.JSON(200, gin.H{
				"code":    http.StatusBadRequest,
				"message": "发送失败",
			})
			c.Abort()
			return
		}
		model.RDB.Set(key, VerificationCode, time.Duration(3)*time.Minute)
		c.JSON(200, gin.H{
			"code":    http.StatusOK,
			"message": "success",
		})
		return
	} else {
		c.JSON(200, gin.H{
			"code":    http.StatusBadRequest,
			"message": "邮箱格式错误",
		})
	}

}

// ^ 注册
func Register(c *gin.Context) {
	type registerParam struct {
		UserName         string `form:"UserName"`
		Password         string `form:"Password"`
		Email            string `form:"Email"`
		VerificationCode string `form:"VerificationCode"`
	}
	var (
		registerparam registerParam
		user          model.User
	)

	c.Bind(&registerparam)
	fmt.Println(model.RDB.Get(fmt.Sprintf("VerificationCode-%s", registerparam.Email)).Val())
	if model.RDB.Get(fmt.Sprintf("VerificationCode-%s", registerparam.Email)).Val() != registerparam.VerificationCode {
		c.JSON(200, gin.H{
			"code":    http.StatusBadRequest,
			"message": "验证码错误",
		})
		return
	} else {
		model.RDB.Del(fmt.Sprintf("VerificationCode-%s", registerparam.Email))
	}

	//!数据校验

	if func() bool {
		for {
			user.UserID = strconv.Itoa(util.Random.Int())
			model.DB.Model(&model.User{}).Select("UserID").Find(&user)
			if user.UserID != "" { //!用户ID已存在
				c.JSON(200, gin.H{
					"code":    http.StatusBadRequest,
					"message": "ID已存在",
				})
				return false
			} else {
				break
			}
		}

		// user_, _ := regexp.MatchString(`^[\d|\w]{10,14}$`, registerparam.UserID)             //!用户ID长度在10~14之间，只能包含字母、数字
		pass_, _ := regexp.MatchString(`^[A-Z][\d|\w]{5,13}$`, registerparam.Password)       //!密码以字母开头，长度在6~14之间，只能包含字符、数字和下划线
		email, _ := regexp.MatchString(`^[\d|\w]+@[\d|\w]+\.[\d|\w]+$`, registerparam.Email) //!邮箱格式
		// sex, _ := regexp.MatchString(`[0-2]`, registerparam.Sex)                             //!性别只能为0、1、2
		fmt.Println(pass_, email)
		if pass_ && email {
			return true
		} else {
			c.JSON(200, gin.H{
				"code":    http.StatusBadRequest,
				"message": "注册失败",
			})
			return false
		}
	}() {
		//!数据入库

		if result := model.DB.Create(&model.User{
			UserID:   user.UserID,
			UserName: registerparam.UserName,
			Password: util.MD5(registerparam.Password),
			Email:    registerparam.Email,
		}); result.Error != nil {
			c.JSON(200, gin.H{
				"code":    http.StatusBadRequest,
				"message": "注册失败",
			})
		} else {
			c.JSON(200, gin.H{
				"code":    http.StatusOK,
				"message": "注册成功",
			})
		}

	}

}
