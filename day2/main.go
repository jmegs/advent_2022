package main

import (
	_ "embed"
	"fmt"
	"strings"
)

//go:embed input.txt
var input string

// opponent
// A: rock
// B: paper
// C: scissors

// you
// X: Rock
// Y: Paper
// Z: Scissors

func main() {
	game1 := map[string]int{
		"A X": 1 + 3,
		"B X": 1 + 0,
		"C X": 1 + 6,
		"A Y": 2 + 6,
		"B Y": 2 + 3,
		"C Y": 2 + 0,
		"A Z": 3 + 0,
		"B Z": 3 + 6,
		"C Z": 3 + 3,
	}

	game2 := map[string]int{
		"A X": 3 + 0,
		"B X": 1 + 0,
		"C X": 2 + 0,
		"A Y": 1 + 3,
		"B Y": 2 + 3,
		"C Y": 3 + 3,
		"A Z": 2 + 6,
		"B Z": 3 + 6,
		"C Z": 1 + 6,
	}

	var total1 int
	var total2 int

	games := strings.Split(input, "\n")
	for _, game := range games {
		total1 += game1[game]
		total2 += game2[game]
	}

	fmt.Println("Part 1:", total1)
	fmt.Println("Part 2:", total2)
}
