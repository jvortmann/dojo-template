package main

var T9 = map[rune] []string {
	'2': { "A", "B", "C" },
	'3': { "D", "E", "F" },
	'4': { "G", "H", "I" },
	'5': { "J", "K", "L" },
	'6': { "M", "N", "O" },
	'7': { "P", "Q", "R", "S" },
	'8': { "T", "U", "V" },
	'9': { "W", "X", "Y", "Z" },
	'0': { " " },
	'_': { "" },
}

func parseT9(in string) string {

	// SEMPRE ACESSO O DOJOPUZZLES
	// 77773367_7773302_222337777_777766606660366656667889999_9999555337777

	substringSize := 0
	lastChar := rune(in[0])
	translatedValue := ""
	for _, char := range in {
  	if (char == lastChar) {
			substringSize++
		} else {
			//traduzir
			translatedValue = translatedValue + translate(lastChar, substringSize)

			//trocar
			lastChar = char
			substringSize = 1
		}
	}

	translatedValue = translatedValue + translate(lastChar, substringSize)

	return translatedValue
}

func translate(key rune, amount int) string {
	return T9[key][amount - 1]
}

func revertedT9Map(t9 map[rune][]string) map[string] string {

	inverseT9 := make(map[string] string)

	for k, v := range t9 {
		for pos, letter := range v {
			aux := ""

			for i:=0; i<=pos; i++ {
				aux += string(k)
			}

			inverseT9[letter] = aux
		}
	}

	return inverseT9
}

func untranslate(in string) string {
	return ""
}
