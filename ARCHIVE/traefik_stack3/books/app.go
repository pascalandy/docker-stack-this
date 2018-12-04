package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

type Book struct {
	Name string
}

func HealthCheckEndpoint(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Working ...")
}

func BooksEndpoint(w http.ResponseWriter, r *http.Request) {
	books := []Book{
		Book{"Frankenstein"},
		Book{"The Way We Live Now"},
		Book{"The Brothers Karamazov"},
	}
	json.NewEncoder(w).Encode(&books)
}

func main() {
	http.HandleFunc("/health", HealthCheckEndpoint)
	http.HandleFunc("/books", BooksEndpoint)
	if err := http.ListenAndServe(":5000", nil); err != nil {
		log.Fatal(err)
	}
}
