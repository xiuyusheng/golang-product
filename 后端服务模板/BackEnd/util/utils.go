package util

import (
	"math/rand"
	"time"
)

// 随机字符串
var LettersUppercase = []rune("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
var LettersLowercase = []rune("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
var Random = rand.New(rand.NewSource(time.Now().UnixNano()))

func RandStr(str_len int, letters []rune) string {
	rand_bytes := make([]rune, str_len)
	for i := range rand_bytes {
		rand_bytes[i] = letters[rand.Intn(len(letters))]
	}
	return string(rand_bytes)
}
