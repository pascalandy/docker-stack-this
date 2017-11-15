output "MoviesAPI" {
  value = "${aws_instance.movies-instance.public_ip}:5000"
}

output "BooksAPI" {
  value = "${aws_instance.books-instance.public_ip}:5000"
}
