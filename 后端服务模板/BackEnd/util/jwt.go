package util

import (
	"QuestionnaireSurvey/conf"
	"errors"
	"time"

	"github.com/golang-jwt/jwt/v5"
)

type MyCustomClaims struct {
	UserID     string
	UserType   int
	GrantScope string
	jwt.RegisteredClaims
}

func GenerateTokenUsingHs256(UserID string, UserType int, ID string) (string, error) {
	claim := MyCustomClaims{
		UserID:     UserID,
		UserType:   UserType,
		GrantScope: "open",
		RegisteredClaims: jwt.RegisteredClaims{
			Issuer:    conf.Config.Jwt.Issuer,                                                                   // 签发者
			Subject:   conf.Config.Jwt.Subject,                                                                  // 签发对象
			Audience:  jwt.ClaimStrings{"Android_APP", "IOS_APP"},                                               //签发受众
			ExpiresAt: jwt.NewNumericDate(time.Now().Add(time.Hour * time.Duration(conf.Config.Jwt.ExpiresAt))), //过期时间
			NotBefore: jwt.NewNumericDate(time.Now()),                                                           //最早使用时间
			IssuedAt:  jwt.NewNumericDate(time.Now()),                                                           //签发时间
			ID:        ID,                                                                                       // wt ID, 类似于盐值
		},
	}
	token, err := jwt.NewWithClaims(jwt.SigningMethodHS256, claim).SignedString([]byte(conf.Config.Jwt.Secret))
	return token, err
}

func ParseTokenHs256(token_string string) (*MyCustomClaims, error) {
	token, err := jwt.ParseWithClaims(token_string, &MyCustomClaims{}, func(token *jwt.Token) (interface{}, error) {
		return []byte(conf.Config.Jwt.Secret), nil //返回签名密钥
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
