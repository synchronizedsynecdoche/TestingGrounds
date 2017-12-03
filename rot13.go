package main

import (
	"fmt"
	"bufio"
	"os"
)
func main() {

	s := bufio.NewReader(os.Stdin)

	userIn, _ := s.ReadString('\n')

	var out string

	alph := [26]string{"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
	alphBig := [26]string{"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}

	for i :=0 ; i < len(userIn) ; i++ {

		for j := 0 ; j < len(alph) ; j++ {

			if string(userIn[i]) == alph[j]{

				out += alph[ (j + i+1) % 26]
			}
			if string(userIn[i]) == alphBig[j]{

				out += alphBig[(j + i+1) % 26 ]
			}
		}

	}
	fmt.Print(out)
}
