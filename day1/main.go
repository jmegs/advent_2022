package main

import (
	_ "embed"
	"fmt"
	"sort"
	"strconv"
	"strings"
)

//go:embed input.txt
var input string

func sum(array []string) int {
	result := 0
	for _, v := range array {
		i, _ := strconv.Atoi(v)
		result += i
	}
	return result
}

func main() {
	// part 1
	byElf := strings.Split(input, "\n\n")
	var totals []int
	for _, v := range byElf {
		arr := strings.Split(v, "\n")
		t := sum(arr)
		totals = append(totals, t)
	}
	sort.Ints(totals)
	fmt.Println("Most Cals:", totals[len(totals)-1])

	// part 2
	top3 := totals[len(totals)-3:]
	var topsum int
	for _, v := range top3 {
		topsum += v
	}
	fmt.Println("Top 3 Cals:", topsum)
}
