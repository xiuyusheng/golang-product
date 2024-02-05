package util

import (
	"jiaowu/model"
	"jiaowu/pkg"
	"strconv"
	"sync"

	"github.com/xuri/excelize/v2"
)

var wg sync.WaitGroup

func WriteExcel(sheetName string, stus []model.Student) *excelize.File {
	// 创建一个新的Excel文件
	file := excelize.NewFile()

	// 创建一个工作表
	sheetIndex, _ := file.NewSheet(sheetName)
	// 创建样式

	style_title, _ := file.NewStyle(&excelize.Style{Font: &excelize.Font{Size: 18}, Alignment: &excelize.Alignment{Horizontal: "center", Vertical: "center", WrapText: true}})
	file.SetCellStyle(sheetName, "A2", "A2", style_title)
	file.MergeCell(sheetName, "A2", "K2")
	file.SetCellValue(sheetName, "A2", pkg.Package.Excel.Title)

	style_3, _ := file.NewStyle(&excelize.Style{Font: &excelize.Font{Size: 10}})
	file.SetCellStyle(sheetName, "A3", "A3", style_3)
	file.MergeCell(sheetName, "A3", "K3")
	file.SetCellValue(sheetName, "A3", "学院名称（盖章）：")

	file.SetCellStyle(sheetName, "A4", "J4", style_3)
	file.MergeCell(sheetName, "A4", "E4")
	file.SetCellValue(sheetName, "A4", "学院领导签字：")

	file.SetCellValue(sheetName, "F4", "专业负责人签字：")
	file.SetCellValue(sheetName, "J4", "日期：")

	//标题栏设置值
	file.SetCellValue(sheetName, "A5", "序号")
	file.SetCellValue(sheetName, "B5", "学号")
	file.SetCellValue(sheetName, "C5", "姓名")
	file.SetCellValue(sheetName, "D5", "专业名称")
	file.SetCellValue(sheetName, "E5", "行政班")
	file.SetCellValue(sheetName, "F5", "技能证书名称")
	file.SetCellValue(sheetName, "G5", "等级")
	file.SetCellValue(sheetName, "H5", "发证机构名称")
	file.SetCellValue(sheetName, "I5", "鉴定地点")
	file.SetCellValue(sheetName, "J5", "发证时间")
	file.SetCellValue(sheetName, "K5", "是否符合人才培养方案中职业技能证书的要求")
	//设置列宽度
	file.SetColWidth(sheetName, "A", "A", 6.4)
	file.SetColWidth(sheetName, "B", "B", 16.4)
	file.SetColWidth(sheetName, "C", "C", 8.47)
	file.SetColWidth(sheetName, "D", "D", 18.40)
	file.SetColWidth(sheetName, "E", "E", 31.40)
	file.SetColWidth(sheetName, "F", "F", 63.8)
	file.SetColWidth(sheetName, "G", "G", 9.47)
	file.SetColWidth(sheetName, "H", "H", 38.40)
	file.SetColWidth(sheetName, "I", "I", 5.47)
	file.SetColWidth(sheetName, "J", "J", 16.40)
	file.SetColWidth(sheetName, "K", "K", 15.40)
	//设置高度
	file.SetRowHeight(sheetName, 5, 45.0)
	file.SetRowHeight(sheetName, 2, 22.5)
	// 将结构体数据写入Excel文件
	wg.Add(len(stus))
	type Info struct {
		SID                  int    `gorm:":SID"`
		SName                string `gorm:"SName"`
		PName                string `gorm:"PName"`
		ClassName            string `gorm:"ClassName"`
		CertificateName      string `gorm:"Certificate"`
		CertificateLevel     string `gorm:"CertificateLevel"`
		CertificateAuthority string `gorm:"CertificateAuthority"`
		IdentifyLocations    string `gorm:"IdentifyLocations"`
		IssuanceDate         string `gorm:"IssuanceDate"`
		IsThrough            bool   `gorm:"IsThrough"`
	}
	//写入文件(字节数组)
	for index, student := range stus {
		// os.WriteFile("./test.txt", []byte(fmt.Sprintln(student.SID)), 0666)
		go func(student model.Student, index int) {
			var info *Info
			model.DB.Model(model.Student{}).Select("student.SID,student.SName,professional.PName,class.ClassName,certificate.CertificateName,certificate.CertificateLevel,certificate.CertificateAuthority,certificate.IdentifyLocations,certificate.IssuanceDate,certificate.IsThrough").Joins("LEFT JOIN class ON student.ClassID=class.ClassID").Joins("LEFT JOIN certificate ON student.CertificateID=certificate.CertificateID").Joins("LEFT JOIN professional ON student.PID=professional.PID").Where("student.SID=?", student.SID).Find(&info)
			var isth string
			if info.IsThrough {
				isth = "是"
			} else {
				isth = "否"
			}
			file.SetCellValue(sheetName, "A"+strconv.Itoa(index+6), index+1)
			file.SetCellValue(sheetName, "B"+strconv.Itoa(index+6), strconv.Itoa(info.SID))
			file.SetCellValue(sheetName, "C"+strconv.Itoa(index+6), info.SName)
			file.SetCellValue(sheetName, "D"+strconv.Itoa(index+6), info.PName)
			file.SetCellValue(sheetName, "E"+strconv.Itoa(index+6), info.ClassName)
			file.SetCellValue(sheetName, "F"+strconv.Itoa(index+6), info.CertificateName)
			file.SetCellValue(sheetName, "G"+strconv.Itoa(index+6), info.CertificateLevel)
			file.SetCellValue(sheetName, "H"+strconv.Itoa(index+6), info.CertificateAuthority)
			file.SetCellValue(sheetName, "I"+strconv.Itoa(index+6), info.IdentifyLocations)
			file.SetCellValue(sheetName, "J"+strconv.Itoa(index+6), info.IssuanceDate)
			file.SetCellValue(sheetName, "K"+strconv.Itoa(index+6), isth)
			wg.Done()
		}(student, index)
	}
	wg.Wait()
	//居中显示
	style_3, _ = file.NewStyle(&excelize.Style{Alignment: &excelize.Alignment{Horizontal: "center", Vertical: "center", WrapText: true}, Border: []excelize.Border{{Type: "left", Color: "000000", Style: 1}, {Type: "top", Color: "000000", Style: 1}, {Type: "bottom", Color: "000000", Style: 1}, {Type: "right", Color: "000000", Style: 1}}})
	file.SetCellStyle(sheetName, "A5", "K"+strconv.Itoa(len(stus)+5), style_3)
	//标题栏标注黄色
	style_color1, _ := file.NewStyle(&excelize.Style{
		Fill: excelize.Fill{Type: "pattern", Color: []string{"fcfc04"}, Pattern: 1}, Alignment: &excelize.Alignment{Horizontal: "center", Vertical: "center", WrapText: true}, Border: []excelize.Border{{Type: "left", Color: "000000", Style: 1}, {Type: "top", Color: "000000", Style: 1}, {Type: "bottom", Color: "000000", Style: 1}, {Type: "right", Color: "000000", Style: 1}},
	})
	file.SetCellStyle(sheetName, "C5", "C5", style_color1)
	file.SetCellStyle(sheetName, "F5", "J5", style_color1)
	//?底部
	margin_top := 7
	file.SetCellValue(sheetName, "A"+strconv.Itoa(len(stus)+margin_top), "注释：")
	file.SetCellValue(sheetName, "B"+strconv.Itoa(len(stus)+margin_top), "1.等级（单一选项）：是指发证部门认可的技能证书；无等级是指不分等级的资格证书。")
	file.SetCellValue(sheetName, "B"+strconv.Itoa(len(stus)+margin_top+1), "2.鉴定地点（单一选项）：校内/校外。")
	file.SetCellValue(sheetName, "B"+strconv.Itoa(len(stus)+margin_top+2), "3.发证时间以证书上的时间为准；填写格式为“年月”，例如：2017年5月。")
	file.SetCellValue(sheetName, "B"+strconv.Itoa(len(stus)+margin_top+3), "4.如学生有多个职业技能证书，分多条记录填写，不要合并单元格。")

	//总人数
	// file.MergeCell(sheetName, "A1", "B1")
	// file.SetCellValue(sheetName, "A1", "人数："+strconv.Itoa(len(stus)))
	//已上传人数
	// file.MergeCell(sheetName, "D1", "E1")
	// file.SetCellValue(sheetName, "D1", "已上传："+strconv.Itoa(uploadNum))

	// 设置活动工作表
	file.SetActiveSheet(sheetIndex)
	return file
}
