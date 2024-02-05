package model

import (
	"fmt"
	"jiaowu/pkg"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"gorm.io/gorm/schema"
)

var DB *gorm.DB

func init() {
	MysqlPackge := pkg.Package.Mysql
	// root:root@tcp(127.0.0.1:3306)/gorm?
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=utf8mb4&parseTime=True&loc=Local&timeout=%s", MysqlPackge.Username, MysqlPackge.Password, MysqlPackge.Host, MysqlPackge.Port, MysqlPackge.Dbname, MysqlPackge.Timeout)
	//连接MYSQL, 获得DB类型实例，用于后面的数据库读写操作。
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Info), NamingStrategy: schema.NamingStrategy{
			SingularTable: true, // 使用单数表名
		},
	})
	if err != nil {
		panic("连接数据库失败, error=" + err.Error())
	}

	// 连接成功
	DB = db
}
