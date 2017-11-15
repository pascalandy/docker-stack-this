package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

type Movie struct {
	Name string
}

func HealthCheckEndpoint(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Working ...")
}

func MoviesEndpoint(w http.ResponseWriter, r *http.Request) {
	movies := []Movie{
		Movie{"Minions"},
		Movie{"Titanic"},
		Movie{"Gladiator"},
	}
	json.NewEncoder(w).Encode(&movies)
}

func main() {
	http.HandleFunc("/health", HealthCheckEndpoint)
	http.HandleFunc("/movies", MoviesEndpoint)
	if err := http.ListenAndServe(":5000", nil); err != nil {
		log.Fatal(err)
	}
}
