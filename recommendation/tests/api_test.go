package tests

import "testing"

func TestBasicMath(t *testing.T) {
    sum := 2 + 3
    expected := 5
    if sum != expected {
        t.Errorf("Expected %d but got %d", expected, sum)
    }
}
