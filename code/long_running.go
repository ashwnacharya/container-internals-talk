package main

import (
    "fmt"
    "time"
)

func main() {
    for j := 1; j <= 100; j++ {

        time.Sleep(time.Millisecond * 1000)
        fmt.Print(".")
    }
}