import 'dart:io';
import 'LibraryManager.dart';
import 'author.dart';
import 'book.dart';
import 'member.dart';

void main() async {
  LibraryManager libraryManager = LibraryManager();

  // Load data at startup
  await libraryManager.loadData();

  while (true) {
    print('Library Management');
    print('1. Add Book');
    print('2. View All Books');
    print('3. Update Book');
    print('4. Delete Book');
    print('5. Search Books');
    print('6. Lend Book');
    print('7. Return Book');
    print('----------------------');
    print('8. Add Author');
    print('9. View All Authors');
    print('10. Update Author');
    print('11. Delete Author');
    print('----------------------');
    print('12. Add Member');
    print('13. View All Members');
    print('14. Update Member');
    print('15. Delete Member');
    print('16. Exit');
    print('----------------------');
    print('Enter your choice: ');

    var choice = stdin.readLineSync();

    if (choice == '1') {
      // Add Book
      print('Enter title: ');
      String title = stdin.readLineSync()!;
      print('Enter author: ');
      String author = stdin.readLineSync()!;
      print('Enter publication year: ');
      int publicationYear = int.parse(stdin.readLineSync()!);
      print('Enter ISBN: ');
      String isbn = stdin.readLineSync()!;
      libraryManager.addBook(Book(title, author, publicationYear, isbn));
    } else if (choice == '2') {
      // View All Books
      List<Book> books = libraryManager.viewAllBooks();
      for (var book in books) {
        print(
            'Title: ${book.title}, Author: ${book.author}, Year: ${book.publicationYear}, ISBN: ${book.isbn}, Lent: ${book.isLent}, Due Date: ${book.dueDate}');
      }
    } else if (choice == '3') {
      // Update Book
      print('Enter ISBN of the book for update: ');
      String isbn = stdin.readLineSync()!;
      print('Enter new title: ');
      String title = stdin.readLineSync()!;
      print('Enter new author: ');
      String author = stdin.readLineSync()!;
      print('Enter publication year: ');
      int publicationYear = int.parse(stdin.readLineSync()!);
      libraryManager.updateBook(
          isbn, Book(title, author, publicationYear, isbn));
    } else if (choice == '4') {
      // Delete Book
      print('Enter ISBN to delete book: ');
      String isbn = stdin.readLineSync()!;
      libraryManager.deleteBook(isbn);
    } else if (choice == '5') {
      // Search Books
      print('Enter title to search (leave empty if not searching by title): ');
      String? title = stdin.readLineSync();
      print(
          'Enter author to search (leave empty if not searching by author): ');
      String? author = stdin.readLineSync();
      List<Book> books = libraryManager.searchBooks(
        title: title,
        author: author,
      );
      for (var book in books) {
        print(
            'Title: ${book.title}, Author: ${book.author}, Year: ${book.publicationYear}, ISBN: ${book.isbn}, Lent: ${book.isLent}, Due Date: ${book.dueDate}');
      }
    } else if (choice == '6') {
      // Lend Book
      print('Enter ISBN of the book to lend: ');
      String isbn = stdin.readLineSync()!;
      print('Enter Member ID to lend the book to: ');
      String memberId = stdin.readLineSync()!;
      print('Enter due date (yyyy-mm-dd): ');
      String dueDate = stdin.readLineSync()!;
      libraryManager.lendBook(isbn, memberId, dueDate);
    } else if (choice == '7') {
      // Return Book
      print('Enter ISBN of the book to return: ');
      String isbn = stdin.readLineSync()!;
      libraryManager.returnBook(isbn);
    } else if (choice == '8') {
      // Add Author
      print('Enter name: ');
      String name = stdin.readLineSync()!;
      libraryManager.addAuthor(Author(name, []));
    } else if (choice == '9') {
      // View All Authors
      List<Author> authors = libraryManager.viewAllAuthors();
      for (var author in authors) {
        print('Name: ${author.name}, Books Written:');
        for (var isbn in author.bookWritten) {
          var book = libraryManager.books.firstWhere(
              (book) => book.isbn == isbn,
              orElse: () => Book('Unknown', 'Unknown', 0, 'Unknown'));
          print(
              '  Title: ${book.title}, Year: ${book.publicationYear}, ISBN: ${book.isbn}');
        }
      }
    } else if (choice == '10') {
      // Update Author
      print('Enter name of the author to update: ');
      String name = stdin.readLineSync()!;
      print('Enter new name: ');
      String newName = stdin.readLineSync()!;
      libraryManager.updateAuthor(name, Author(newName, []));
    } else if (choice == '11') {
      // Delete Author
      print('Enter name of the author to delete: ');
      String name = stdin.readLineSync()!;
      libraryManager.deleteAuthor(name);
    } else if (choice == '12') {
      // Add Member
      print('Enter name: ');
      String name = stdin.readLineSync()!;
      print('Enter Member ID: ');
      String memberId = stdin.readLineSync()!;
      libraryManager.addMember(Member(name, memberId, []));
    } else if (choice == '13') {
      // View All Members
      List<Member> members = libraryManager.viewAllMembers();
      for (var member in members) {
        print(
            'Name: ${member.name}, Member ID: ${member.memberId}, Borrowed Books: ${member.borrowed}');
      }
    } else if (choice == '14') {
      // Update Member
      print('Enter Member ID of the member to update: ');
      String memberId = stdin.readLineSync()!;
      print('Enter new name: ');
      String name = stdin.readLineSync()!;
      libraryManager.updateMember(memberId, Member(name, memberId, []));
    } else if (choice == '15') {
      // Delete Member
      print('Enter Member ID of the member to delete: ');
      String memberId = stdin.readLineSync()!;
      libraryManager.deleteMember(memberId);
    } else if (choice == '16') {
      // Exit
      await libraryManager.saveData();
      print('Exiting...');
      break;
    } else {
      print('Invalid choice. Please try again.');
    }
  }
}