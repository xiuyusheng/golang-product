package router

import (
	"jiaowu/controller/middleware"
	"jiaowu/model"
	"jiaowu/util"
	"net/http"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
)

// 登录
func Login(c *gin.Context) {
	var (
		State  string
		Path   string
		Method string
	)
	identity, err := strconv.Atoi(c.PostForm("identity"))
	if err != nil {
		c.JSON(http.StatusOK, gin.H{
			"code":    400,
			"Message": "身份认证错误",
		})
		c.Abort()
		return
	}

	ID, err := strconv.Atoi(c.PostForm("ID"))
	if err != nil {
		c.JSON(200, gin.H{
			"code":    400,
			"Message": "Parameter error",
		})
		c.Abort()
		return
	}
	switch identity {
	case 0: //!教师认证
		var admin model.Admin

		model.DB.Find(&admin, model.Admin{AID: ID})
		if err != nil {
			c.JSON(http.StatusOK, gin.H{
				"code":    400,
				"Message": "身份认证错误",
			})
			c.Abort()
			return
		}
		if admin.AID != 0 {
			// password, err := util.RsaDecryptBase64(c.PostForm("Password"), util.PrivateKey) //密码解密
			password := c.PostForm("Password")
			if err != nil {
				c.JSON(200, gin.H{
					"code": 400, "Message": err,
				})
				c.Abort()
				return
			} else {
				if admin.Apassword == password {
					token, err := util.GenerateTokenUsingHs256(ID, identity)
					if err != nil {
						c.JSON(http.StatusOK, gin.H{
							"code": 400, "Message": "登录失败",
						})
						c.Abort()
						return
					} else {
						model.DB.Model(&admin).Where("AID = ?", ID).Update("LastLoginTime", time.Now())
						c.JSON(200, gin.H{
							"code": 200, "Message": "登录成功", "token": token,
						})
						c.Abort()
						return
					}
				} else {
					c.JSON(200, gin.H{
						"code": 400, "Message": "登录失败",
					})
					c.Abort()
					return
				}
			}
		} else {
			c.JSON(200, gin.H{
				"code": 400, "Message": "账号不存在",
			})
			c.Abort()
			return
		}
	case 1: //!学生认证
		studyone := model.Studyone{}
		model.DB.Model(model.Studyone{}).Select("IsEnable,SOID,SPassword").Find(&studyone, model.Studyone{SOID: ID})

		if err != nil {
			c.JSON(200, gin.H{
				"code": 400, "Message": "登录失败",
			})
			c.Abort()
			return
		}
		if studyone.SOID != 0 {
			if !studyone.IsEnable {
				c.JSON(200, gin.H{
					"code": 400, "Message": "账号已被禁用",
				})
				c.Abort()
				return
			}
			// password, err := util.RsaDecryptBase64(c.PostForm("Password"), util.PrivateKey) //密码解密
			password := c.PostForm("Password")
			if err != nil {
				c.JSON(200, gin.H{
					"code": 400, "Message": "密码错误",
				})
				c.Abort()
				return
			} else {
				if studyone.SPassword == password {
					token, err := util.GenerateTokenUsingHs256(ID, identity)
					if err != nil {
						c.JSON(http.StatusOK, gin.H{
							"code": 400, "Message": "登录失败",
						})
					} else {
						model.DB.Model(&studyone).Where("SOID = ?", ID).Update("LastLoginTime", time.Now())
						c.JSON(http.StatusOK, gin.H{
							"code": 200, "Message": "登录成功", "token": token,
						})
						c.Abort()
						return
					}
				} else {
					c.JSON(http.StatusOK, gin.H{
						"code": 400, "Message": "密码错误",
					})
					c.Abort()
					return
				}
			}
		} else {
			c.JSON(200, gin.H{
				"code": 400, "Message": "账号不存在！",
			})
			c.Abort()
			return
		}
	}
	middleware.Save_log(ID, State, Path, Method) //^记录登录日志

}
