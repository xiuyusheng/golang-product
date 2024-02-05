package pkg

import (
	"encoding/json"
	"log"
	"os"
)

type LogConfig struct {
	Level      string `json:"level"`
	Filename   string `json:"filename"`
	MaxSize    int    `json:"maxsize"`
	MaxAge     int    `json:"max_age"`
	MaxBackups int    `json:"max_backups"`
}

type Cos struct {
	AppId     string `json:"appId"`
	SecretId  string `json:"secretId"`
	SecretKey string `json:"secretkey"`
}

type RegisteredClaims struct {
	Issuer    string `json:"Issuer"`
	Subject   string `json:"Subject"`
	RandIDlen int    `json:"randIDlen"`
	Hour      int    `json:"hours"`
}

type Jwt struct {
	JwtKey           string           `json:"jwt_key"`
	Registeredclaims RegisteredClaims `json:"registeredClaims"`
}

type MySQLConfig struct {
	Username string `json:"username"`
	Password string `json:"password"`
	Host     string `json:"host"`
	Port     int    `json:"port"`
	Dbname   string `json:"dbname"`
	Timeout  string `json:"timeout"`
}

type ExcelPkg struct {
	Title         string `json:"title"`
	Nouploadcolor string `json:"nouploadcolor"`
	Markcolor     string `json:"markcolor"`
}
type Packages struct {
	Mysql     MySQLConfig `json:"mysql"`
	RsaBit    int         `json:"rsa_bit"`
	Timing    int         `json:"timing"`
	Jwt       Jwt         `json:"jwt"`
	Cos       Cos         `json:"cos"`
	Excel     ExcelPkg    `json:"excel_pkg"`
	LogConfig LogConfig   `json:"log"`
}
var Package *Packages
func init() {
	jsonPath := "pkg/packge.json"

	jsonFile, err := os.Open(jsonPath) // 打开 json 文件
	if err != nil {
		log.Printf("open json file %v error [ %v ]", jsonPath, err)
		return
	}
	defer jsonFile.Close()

	decoder := json.NewDecoder(jsonFile) // 创建 json 解码器
	err = decoder.Decode(&Package)       // 解码 json 文件
	if err != nil {
		log.Printf("decode error [ %v ]", err)
		return
	}
}
