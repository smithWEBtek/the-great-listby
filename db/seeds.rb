# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
new_user = User.create(email: "test@gmail.com", password: "123456789")
fiction = Genre.create(name: "Fiction")
fitzgerald = Author.create(name: "F.Scott Fitzgerald")
great_gatsby = Book.create(title: "The Great Gatsby", blurb: "A book about the American Dream", genre: fiction, author: fitzgerald)
new_book_list = BookList.create(title: "summer", user: new_user)
BookListsBook.create(book: great_gatsby, book_list: new_book_list)
