package util

import (
	"fmt"
	"log"
	"net/smtp"

	"github.com/jordan-wright/email"
)

func Email(TO, Cc []string, Subject string, Text []byte, HTML []byte, AttachFile string) error {
	defer func() {
		if err := recover(); err != nil {
			fmt.Println(err)

		}
	}()
	// 简单设置 log 参数
	log.SetFlags(log.Lshortfile | log.LstdFlags)
	em := email.NewEmail()

	{
		// 设置 sender 发送方 的邮箱 ， 此处可以填写自己的邮箱
		em.From = "问答矩阵<3394954185@qq.com>"

		// 设置 receiver 接收方 的邮箱  此处也可以填写自己的邮箱， 就是自己发邮件给自己
		em.To = TO

		// 设置主题
		em.Subject = Subject

		// 设置抄送
		em.Cc = Cc

		// 简单设置文件发送的内容，暂时设置成纯文本
		em.Text = Text
		em.HTML = HTML
		//设置服务器相关的配置
		if HTML == nil {
			em.HTML = []byte(fmt.Sprintf(`
		<tbody><tr><td><table width="100%%" border="0" cellspacing="0" cellpadding="0"><tbody><tr><td align="left"><span width="92" height="32"style="display: block; width: 92px; height: 32px;">问卷矩阵</span></td><td align="right"><img width="32" height="32" style="display: block; width: 32px; height: 32px;" src="https://ssl.gstatic.com/accountalerts/email/keyhole.png"></td></tr></tbody></table></td></tr><tr height="16"></tr><tr><td><table bgcolor="#4184F3" width="100%%" border="0" cellspacing="0" cellpadding="0" style="min-width: 332px; max-width: 600px; border: 1px solid #E0E0E0; border-bottom: 0; border-top-left-radius: 3px; border-top-right-radius: 3px;"><tbody><tr><td height="72px" colspan="3"></td></tr><tr><td width="32px"></td><td style="font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 24px; color: #F2F2F2; line-height: 1.25;">问卷矩阵 验证码</td><td width="32px"></td></tr><tr><td height="18px" colspan="3"></td></tr></tbody></table></td></tr><tr><td><table bgcolor="#FAFAFA" width="100%%" border="0" cellspacing="0" cellpadding="0" style="min-width: 332px; max-width: 600px; border: 1px solid #F0F0F0; border-bottom: 1px solid #C0C0C0; border-top: 0; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px;"><tbody><tr height="16px"><td width="32px" rowspan="3"></td><td></td><td width="32px" rowspan="3"></td></tr><tr><td><p>系统已将该验证码发送到您的电子邮箱，协助您恢复 问卷矩阵 账号的访问权限。</p><div style="text-align: center;"><p dir="ltr"><strong style="text-align: center; font-size: 24px; font-weight: bold;">%s</strong></p></div><p><strong>不知道您为什么会收到这封电子邮件吗？</strong></p><p>这可能是因为有人忘记了自己的 问卷矩阵 账号详细信息，误提供了您的电子邮件地址。您可以不必理会这封电子邮件。</p><p>为了保护您的账号，请不要将该电子邮件转发给别人，也不要将该验证码提供给其他人。</p><p>问卷矩阵 账号团队敬上</p></td></tr><tr height="32px"></tr></tbody></table></td></tr><tr height="16"></tr><tr><td style="max-width: 600px; font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 10px; color: #BCBCBC; line-height: 1.5;"></td></tr></tbody>
		`, string(Text)))
		}

		// 添加附件
		em.AttachFile(AttachFile)
	}
	err := em.Send("smtp.qq.com:25", smtp.PlainAuth("User", "3394954185@qq.com", "zuczxsjbvwsbcjfe", "smtp.qq.com"))
	if err != nil {
		log.Fatal(err)
		return err
	}
	log.Printf("%s send successfully ... ", Text)
	return nil
}
