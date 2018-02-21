Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
User has many Reviews
User has many BookLists
Author has many Books
Genre has many Books
- [X] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
Review belongs to User
Book belongs to Author
Book belongs to Genre
- [X] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
Book has many BookLists through BookFeatures
BookList has many Books through BookFeatures
User has many Books through Reviews
Books have many Users through Reviews

- [ ] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
Bookfeatures.status

- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
Book, Title, Author_id, Genre_id
Genre, Name
Author, Name
Review, Title
BookList, Title

- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

Book.highest_rated_books.by_user(user) URL: /users/:id/highest_rated_books
Book.lowest_rated_books.by_user(user) URL: /users/:id/lowest_rated_books

- [X] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)

/book_lists/:id/book/new, BookList

- [X] Include signup (how e.g. Devise)
Devise
- [X] Include login (how e.g. Devise)
Devise
- [X] Include logout (how e.g. Devise)
Devise
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
Devise/OmniAuth - Facebook
- [X] Include nested resource show or index (URL e.g. users/2/recipes)
books/:id/reviews
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
book_lists/:id/book/new
books/:id/reviews/new
- [X] Include form display of validation errors (form URL e.g. /recipes/new)
book_lists/:id/book/new
book_lists/:id/book/edit
book_lists/new
book_lists/:id/edit
book/:id/review/new
book/:id/review/edit 

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate
