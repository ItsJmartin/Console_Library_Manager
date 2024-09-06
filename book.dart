class Book {
  String title;
  String author;
  int publicationYear;
  String isbn;
  bool isLent;
  String dueDate;

  Book(this.title, this.author, this.publicationYear, this.isbn,
      {this.isLent = false, this.dueDate = ''});

  Map<String, dynamic> toJson() => {
        'title': title,
        'author': author,
        'publicationYear': publicationYear,
        'isbn': isbn,
        'isLent': isLent,
        'dueDate': dueDate,
      };

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        json['title'],
        json['author'],
        json['publicationYear'],
        json['isbn'],
        isLent: json['isLent'],
        dueDate: json['dueDate'],
      );
}