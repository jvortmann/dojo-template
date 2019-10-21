package main

import (
	"testing"
	"reflect"
)
func TestValidRangeForRune0(t *testing.T) {
	for _, char := range "0" {
		if (char != 48) {
			t.Error("The rune 0 in go is not ascii 48")
		}
	}
}


func TestParseT9For222(t *testing.T) {
	result := parseT9("222")

	if (result != "C") {
		t.Error("Expected C but received " + result)
	}
}

func TestParseT9For333(t *testing.T) {
	result := parseT9("333")

	if (result != "F") {
		t.Error("Expected F but received " + result)
	}
}

func TestParseT9ForOI(t *testing.T) {
	result := parseT9("666444")

	if (result != "OI") {
		t.Error("Expected OI but received " + result)
	}
}

func TestParseT9ForOIAI(t *testing.T) {
	result := parseT9("66644402444")

	if (result != "OI AI") {
		t.Error("Expected OI AI but received " + result)
	}
}

func TestParseT9ForABACATE(t *testing.T) {
	result := parseT9("2_22_2_222_2833")

	if (result != "ABACATE") {
		t.Error("Expected ABACATE but received " + result)
	}
}

func TestParseT9ForALongString(t *testing.T) {
	result := parseT9("77773367_7773302_222337777_777766606660366656667889999_9999555337777")

	if (result != "SEMPRE ACESSO O DOJOPUZZLES") {
		t.Error("Expected SEMPRE ACESSO O DOJOPUZZLES but received " + result)
	}
}

func TestTranslateFor7(t *testing.T) {
	letter := translate('7', 1)
	if (letter != "P"){
		t.Error("Expected P but received " + letter)
	}
}


func TestTranslateFor77(t *testing.T) {
	letter := translate('7', 2)
	if (letter != "Q"){
		t.Error("Expected Q but received " + letter)
	}
}


func TestTranslateFor777(t *testing.T) {
	letter := translate('7', 3)
	if (letter != "R"){
		t.Error("Expected R but received " + letter)
	}
}

func TestTranslate9T(t *testing.T) {
	result := untranslate("S")

	if (result != "7777") {
		t.Error("Expected 7777, but received " + result)
	}
}

func TestReverseT9(t *testing.T) {
	fakeMap := map[rune] []string {
		'2': { "A", "B", "C" },
	}

	expectedResult := map[string] string {
		"A": "2",
		"B": "22",
		"C": "222",
	}

	reverseMap := revertedT9Map(fakeMap)

	if (!reflect.DeepEqual(expectedResult, reverseMap)) {
		t.Error("deu ruim")
	}
}
