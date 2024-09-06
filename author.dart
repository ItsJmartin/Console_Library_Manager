class Author {
  String name;
  List<String> bookWritten;

  Author(this.name, this.bookWritten);

  Map<String, dynamic> toJson() => {
        'name': name,
        'bookWritten': bookWritten,
      };

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        json['name'],
        List<String>.from(json['bookWritten']),
      );
}