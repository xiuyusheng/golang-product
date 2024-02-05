package conf

import (
	"fmt"
	"os"

	"gopkg.in/yaml.v3"
)

type Auth struct {
	Identity string `yaml:"IDENTITY"`
	Username string `yaml:"USERNAME"`
	Host     string `yaml:"HOST"`
	Password string `yaml:"PASSWORD"`
}

type Email struct {
	From string `yaml:"FROM"`
	Addr string `yaml:"ADDR"`
	Auth Auth   `yaml:"AUTH"`
}

type Jwt struct {
	Secret    string `yaml:"SECRET"`
	ExpiresAt int64  `yaml:"EXPIRESAT"`
	Issuer    string `yaml:"ISSUER"`
	Subject   string `yaml:"SUBJECT"`
	RandIDlen int    `yaml:"RANDIDLEN"`
}

type Rsa struct {
	Timing  int `yaml:"TIMING"`
	Rsa_bit int `yaml:"RSA_BIT"`
}

type Cos struct {
	AppId     string `yaml:"APPID"`
	SecretID  string `yaml:"SECRETID"`
	SecretKey string `yaml:"SECRETKEY"`
}

type Log struct {
	Level       string `yaml:"LEVEL"`
	Filename    string `yaml:"FILENAME"`
	Maxsize     int    `yaml:"MAXSIZE"`
	Max_age     int    `yaml:"MAX_AGE"`
	Max_backups int    `yaml:"MAX_BACKUPS"`
}

type Mysql_ser struct {
	Username string `yaml:"USERNAME"`
	Password string `yaml:"PASSWORD"`
	Host     string `yaml:"HOST"`
	Port     int    `yaml:"PORT"`
	Dbname   string `yaml:"DBNAME"`
	Timeout  string `yaml:"TIMEOUT"`
}

type Redis_ser struct {
	Username string `yaml:"USERNAME"`
	Password string `yaml:"PASSWORD"`
	Host     string `yaml:"HOST"`
	Port     string `yaml:"PORT"`
	Timeout  int    `yaml:"TIMEOUT"`
}

type REDIS_RSAPUBKEY struct {
	KeyDuration int `yaml:"KEY_DURATION"`
}

type config struct {
	Email           Email           `yaml:"EMAIL"`
	Jwt             Jwt             `yaml:"JWT"`
	Mysql           Mysql_ser       `yaml:"MYSQL"`
	Rsa             Rsa             `yaml:"RSA"`
	Cos             Cos             `yaml:"COS"`
	Log             Log             `yaml:"LOG"`
	Redis_s         Redis_ser       `yaml:"REDIS"`
	Redis_rsapubkey REDIS_RSAPUBKEY `yaml:"REDIS_RSAPUBKEY"`
}

var Config config

func init() {

	dataBytes, err := os.ReadFile("./conf/config.yml")
	if err != nil {
		fmt.Println("读取文件失败：", err)
		return
	}
	err = yaml.Unmarshal(dataBytes, &Config)
	if err != nil {
		fmt.Println("解析 yaml 文件失败：", err)
		return
	}
}
