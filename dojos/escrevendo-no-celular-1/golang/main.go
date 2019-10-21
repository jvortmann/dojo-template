package main

import (
	"strings"
)

func main() {
}

func messageToPhoneKeyboardSequence(message string) string {
	var response string

	base := map[string]string{"abc": "2", "def": "3", "ghi": "4", "jkl": "5", "mno": "6", "pqrs": "7", "tuv": "8", "wxyz": "9", " ": "0"}

	for _, c := range message {
		for key, value := range base {
			if index := strings.Index(key, strings.ToLower(string(c))); index != -1 {
				if len(response) > 0 && string(response[len(response)-1]) == value {
					response += "_"
				}
				response += strings.Repeat(value, index+1)
			}
		}
	}

	return response
}
