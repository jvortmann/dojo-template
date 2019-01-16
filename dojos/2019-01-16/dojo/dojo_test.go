package dojo

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestDojo(t *testing.T) {
	result := dojo()
	assert.Equal(t, result, "dojo")
}
