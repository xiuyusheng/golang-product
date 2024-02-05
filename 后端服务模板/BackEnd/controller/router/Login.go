package router

import (
	"QuestionnaireSurvey/conf"
	"QuestionnaireSurvey/model"
	"QuestionnaireSurvey/util"
	"fmt"
	"net/http"
	"regexp"
	"time"

	"github.com/gin-gonic/gin"
)

// ^ 登录
func Login(c *gin.Context) {
	type loginParam struct {
		UserID   string `form:"UserID"`
		Password string `form:"Password"`
	}
	var (
		loginparam   loginParam
		user         model.User
		err          error
		positioning_ util.Positioning_
		email        string
	)
	c.Bind(&loginparam)
	UserPublicKey := model.RDB.Get(c.GetHeader("User-Agent")).Val()
	if UserPublicKey == "" {
		c.JSON(200, gin.H{
			"code":    http.StatusUnauthorized,
			"message": "无法解密",
		})
		c.Abort()
		return
	}

	loginparam.Password, err = util.RsaDecryptBase64(loginparam.Password, UserPublicKey) //!解密
	if err != nil {
		c.JSON(200, gin.H{
			"code":    http.StatusUnauthorized,
			"message": "登录失败",
		})
	} else if model.DB.Model(&model.User{}).Where("UserID = ?", loginparam.UserID).Find(&user); user.Password == loginparam.Password {
		ID := util.RandStr(conf.Config.Jwt.RandIDlen, util.LettersUppercase)
		token, _ := util.GenerateTokenUsingHs256(loginparam.UserID, user.Identity, ID)
		model.RDB.Set(loginparam.UserID, ID, time.Duration(8)*time.Hour)
		c.JSON(200, gin.H{
			"code":     http.StatusOK,
			"username": loginparam.UserID,
			"token":    token,
		})
		positioning_, err = util.Positioning(c.ClientIP())
		if err != nil {
			model.DB.Model(&model.User{}).Select("Email").Where("UserID = ?", loginparam.UserID).Pluck("Email", &email)
			ok, _ := regexp.MatchString(`^[\d|\w]+@[\d|\w]+\.[\d|\w]+$`, email)
			if ok {
				err := util.Email([]string{fmt.Sprintf("萌宠乐园<%s>", email)}, []string{"3044639452@qq.com"}, "登录通知", nil, []byte(fmt.Sprintf(`
			<div id="qm_con_body"><div id="mailContentContainer" class="qmbox qm_con_body_content qqmail_webmail_only" style="opacity: 1;">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<title>萌宠乐园【登录】</title>
	<style type="text/css">
		.qmeml a:link{color:#1d91e5;text-decoration: none;}
		.qmeml a:hover{text-decoration:none;}
		.qmeml{background:#ececec;padding:35px 0px;}
		.qmeml_wrap{width:864px;}
		p {font-size:14px;line-height:28px;color:#313131;}
		@media (max-width:884px) {
			.qmeml{padding:0;background:none;}
			.qmeml_wrap{width:100%%;min-width:200px;max-width:864px;font-size:16px;}
			.qmeml h2{font-size:16px!important;}
			.qmeml p{font-size:16px;}
			.qmeml_header{padding:10px 10px 6px;}
			.qmeml_content{margin:0px!important;}
		}
		@media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min-device-pixel-ratio: 2) {
			.qmeml .logo {
				width:164px;
				height:38px;
			}
		}
	</style>
	<div class="qmeml qmbox">
		<table cellpadding="0" align="center" style="overflow:hidden;background:#fff;margin:0 auto;text-align:left;position:relative;font-size:14px; font-family:'lucida Grande',Verdana;line-height:1.5;box-shadow:0 0 3px #ccc;border:1px solid #ccc;border-radius:5px;border-collapse:collapse;" class="qmeml_wrap">
			<tbody><tr>
				<th class="qmeml_header" valign="middle" style="height:38px;color:#fff; font-size:14px;line-height:38px; font-weight:bold;text-align:left;padding:10px 24px 6px; border-bottom:1px solid #467ec3;background:#518bcb;border-radius:5px 5px 0 0;">
					<span class="logo" style="float:left;" >萌宠乐园</span>
				</th>
			</tr>
			<tr>
				<td>
					<div class="qmeml_content" style="padding:20px 35px 40px;">
						<h2 style="font-weight:bold;margin-bottom:5px;font-size:14px;" id="qqmlNickName">你好，3044639452：</h2>
						<p style="padding-left:2em;margin:0"> 系统监测到你的账号<a href="mailto:3044639452@qq.com" rel="noopener" target="_blank">3044639452@qq.com</a>于<span style="border-bottom: 1px dashed rgb(204, 204, 204); position: relative;" t="5" times=" 10:54">%s</span>(时间）在%s（地点）使用登录，IP地址为%s， 如非本人操作，请及时修改密码并查看账号的安全性。</p>
					</div>
				</td>
			</tr>
		</tbody></table>
	</div>
<style type="text/css">.qmbox style, .qmbox script, .qmbox head, .qmbox link, .qmbox meta {display: none !important;}</style></div></div>
			`, time.Now(), fmt.Sprintf("%s %s", positioning_.Province, positioning_.City), c.ClientIP())), "") //!发送邮件,通知用户
				if err != nil {
					fmt.Println("邮箱发送失败")
				}
			}
		}
	} else {
		c.JSON(200, gin.H{
			"code":    http.StatusUnauthorized,
			"message": "登录失败",
		})
	}
}
