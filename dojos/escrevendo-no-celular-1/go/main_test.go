package main

import (
	"testing"
)

func TestMessageToPhoneKeyboardSequenceShouldReturnTheSequenceForASingleCharacter(t *testing.T) {
	base := map[string]string{"a": "2", "b": "22", "c": "222", "d": "3"}

	for message, expected := range base {
		result := messageToPhoneKeyboardSequence(message)
		if result != expected {
			t.Errorf("Got %s, expected %s", result, expected)
		}
	}
}

func TestMessageToPhoneKeyboardSequenceShouldReturnWordInSeparatedGroup(t *testing.T) {
	base := map[string]string{"claudio": "2225552883444666", "CLAUDIO": "2225552883444666", "claudio claudio": "222555288344466602225552883444666"}
	for message, expected := range base {
		result := messageToPhoneKeyboardSequence(message)
		if result != expected {
			t.Errorf("Got %s, expected %s", result, expected)
		}
	}
}

func TestMessageToPhoneKeyboardSequenceShouldReturnNumbersSeparatedWithUnderlineWithLettersInSameGroup(t *testing.T) {
	base := map[string]string{"SEMPRE ACESSO O DOJOPUZZLES": "77773367_7773302_222337777_777766606660366656667889999_9999555337777"}

	for message, expected := range base {
		result := messageToPhoneKeyboardSequence(message)
		if result != expected {
			t.Errorf("Got %s, expected %s", result, expected)
		}
	}
}
