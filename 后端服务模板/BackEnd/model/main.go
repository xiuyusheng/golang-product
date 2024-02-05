package model

import (
	"QuestionnaireSurvey/conf"
	"fmt"
	"time"

	"github.com/go-redis/redis"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"gorm.io/gorm/schema"
)

var (
	DB  *gorm.DB
	RDB *redis.Client
)

func init() {
	{ //? 连接mysql数据库
		MysqlPackge := conf.Config.Mysql
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
		fmt.Println("mysql连接成功")
	}
	{ //? 连接redis数据库
		redisPackge := conf.Config.Redis_s
		RDB = redis.NewClient(&redis.Options{

			Addr:        redisPackge.Host + ":" + redisPackge.Port,        //! redis地址
			Password:    redisPackge.Password,                             //! redis密码
			ReadTimeout: 0,                                                //! 读取超时时间
			DialTimeout: time.Duration(redisPackge.Timeout) * time.Second, //! 连接超时时间
		})
		_, err := RDB.Ping().Result()
		if err != nil {
			panic("连接Redis失败, error=" + err.Error())
		}
		fmt.Println("redis连接成功")
	}
}
