package util

import (
	"crypto/rand"
	"crypto/rsa"
	"crypto/x509"
	"encoding/base64"
	"encoding/pem"
	"errors"
	"fmt"
	"jiaowu/pkg"
	"time"
)

var PrivateKey, PublicKey string

func GenRsaKey() {
	priKey, err2 := rsa.GenerateKey(rand.Reader, pkg.Package.RsaBit)
	if err2 != nil {
		panic(err2)
	}
	derStream := x509.MarshalPKCS1PrivateKey(priKey)
	block := &pem.Block{
		Type:  "PRIVATE KEY",
		Bytes: derStream,
	}
	prvKey := pem.EncodeToMemory(block)
	puKey := &priKey.PublicKey
	derPkix, err := x509.MarshalPKIXPublicKey(puKey)
	if err != nil {
		panic(err)
	}
	block = &pem.Block{
		Type:  "PUBLIC KEY",
		Bytes: derPkix,
	}
	pubKey := pem.EncodeToMemory(block)

	PrivateKey = string(prvKey)
	PublicKey = string(pubKey)
}

func init() {
	// 设置定时器，每隔一段时间执行一次任务
	interval := time.Duration(pkg.Package.Timing) * time.Hour // 每隔24小时执行一次任务
	timer := time.NewTicker(interval)
	GenRsaKey()
	// 启动一个goroutine来执行定时任务
	go func() {
		for {
			select {
			case <-timer.C:
				fmt.Printf("1")
				GenRsaKey()
			}
		}
	}()
}

// RsaEncryptBase64 使用 RSA 公钥加密数据, 返回加密后并编码为 base64 的数据
func RsaEncryptBase64(originalData, publicKey string) (string, error) {
	block, _ := pem.Decode([]byte(publicKey))
	pubKey, parseErr := x509.ParsePKIXPublicKey(block.Bytes)
	if parseErr != nil {
		fmt.Println(parseErr)
		return "", errors.New("解析公钥失败")
	}
	encryptedData, err := rsa.EncryptPKCS1v15(rand.Reader, pubKey.(*rsa.PublicKey), []byte(originalData))
	return base64.StdEncoding.EncodeToString(encryptedData), err
}

// RsaDecryptBase64 使用 RSA 私钥解密数据
func RsaDecryptBase64(encryptedData, privateKey string) (string, error) {
	encryptedDecodeBytes, err := base64.StdEncoding.DecodeString(encryptedData)
	if err != nil {
		return "", err
	}
	block, _ := pem.Decode([]byte(privateKey))
	priKey, parseErr := x509.ParsePKCS1PrivateKey(block.Bytes)
	if parseErr != nil {
		fmt.Println(parseErr)
		return "", errors.New("解析私钥失败")
	}

	originalData, encryptErr := rsa.DecryptPKCS1v15(rand.Reader, priKey, encryptedDecodeBytes)
	return string(originalData), encryptErr
}

// bits 生成的公私钥对的位数，一般为 1024 或 2048
// privateKey 生成的私钥
// publicKey 生成的公钥
