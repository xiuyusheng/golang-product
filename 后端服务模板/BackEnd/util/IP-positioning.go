package util

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
)

type Positioning_ struct {
	Status    string `json:"status"`
	Info      string `json:"info"`
	Infocode  string `json:"infocode"`
	Province  string `json:"province"`
	City      string `json:"city"`
	Adcode    string `json:"adcode"`
	Rectangle string `json:"rectangle"`
}

func Positioning(ip string) (data Positioning_, err error) {
	var Positioning_ Positioning_
	positioning, err := http.Get(fmt.Sprintf("https://restapi.amap.com/v3/ip?ip=%s&output=json&key=a3a3ded5a6ace0345eb4b272665fd898", ip))
	if err != nil {
		return Positioning_, err
	}
	defer positioning.Body.Close()
	body, err := io.ReadAll(positioning.Body)
	if err != nil {
		return Positioning_, err
	}
	if err := json.Unmarshal(body, &Positioning_); err != nil {
		return Positioning_, err
	}
	return Positioning_, nil
}
