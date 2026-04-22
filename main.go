package main

import (
    "fmt"
    "log"
    "net/http"
)

func Add(a, b int) int {
    return a + b
}

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintln(w, "Hello from CI/CD pipeline!")
    })
    log.Println("server started on :8080")
    log.Fatal(http.ListenAndServe(":8080", nil))
}