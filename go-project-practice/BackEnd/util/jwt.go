package util

import (
	"errors"
	"jiaowu/pkg"
	"math/rand"
	"time"

	"github.com/golang-jwt/jwt/v5"
)

type MyCustomClaims struct {
	UserID     int
	UserType   int
	GrantScope string
	jwt.RegisteredClaims
}

// 随机字符串
var letters = []rune("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

func RandStr(str_len int) string {
	rand_bytes := make([]rune, str_len)
	for i := range rand_bytes {
		rand_bytes[i] = letters[rand.Intn(len(letters))]
	}
	return string(rand_bytes)
}

func GenerateTokenUsingHs256(UserID int, UserType int) (string, error) {
	claim := MyCustomClaims{
		UserID:     UserID,
		UserType:   UserType,
		GrantScope: "open",
		RegisteredClaims: jwt.RegisteredClaims{
			Issuer:    pkg.Package.Jwt.Registeredclaims.Issuer,                                                              // 签发者
			Subject:   pkg.Package.Jwt.Registeredclaims.Subject,                                                             // 签发对象
			Audience:  jwt.ClaimStrings{"Android_APP", "IOS_APP"},                                                           //签发受众
			ExpiresAt: jwt.NewNumericDate(time.Now().Add(time.Hour * time.Duration(pkg.Package.Jwt.Registeredclaims.Hour))), //过期时间
			NotBefore: jwt.NewNumericDate(time.Now()),                                                                       //最早使用时间
			IssuedAt:  jwt.NewNumericDate(time.Now()),                                                                       //签发时间
			ID:        RandStr(pkg.Package.Jwt.Registeredclaims.RandIDlen),                                                  // wt ID, 类似于盐值
		},
	}
	token, err := jwt.NewWithClaims(jwt.SigningMethodHS256, claim).SignedString([]byte(pkg.Package.Jwt.JwtKey))
	return token, err
}

func ParseTokenHs256(token_string string) (*MyCustomClaims, error) {
	token, err := jwt.ParseWithClaims(token_string, &MyCustomClaims{}, func(token *jwt.Token) (interface{}, error) {
		return []byte(pkg.Package.Jwt.JwtKey), nil //返回签名密钥
	})
	if err != nil {
		return nil, err
	}

	if !token.Valid {
		return nil, errors.New("claim invalid")
	}

	claims, ok := token.Claims.(*MyCustomClaims)
	if !ok {
		return nil, errors.New("invalid claim type")
	}

	return claims, nil
}
