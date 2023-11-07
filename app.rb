# Require necessary files
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

# Sample data
people = []
books = []
rentals = []

# Method to list all books
def list_all_books(books)
  puts 'List of all books:'
  books.each do |book|
    puts "Title: #{book.title}, Author: #{book.author}"
  end
end

# Method to list all people
def list_all_people(people)
  puts 'List of all people:'
  people.each do |person|
    puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
  end
end

# Method to create a person (teacher or student)
def create_person(people, type, id, age, options = {})
  name = options[:name] || 'Unknown'
  parent_permission = options.key?(:parent_permission) ? options[:parent_permission] : true
  specialization = options[:specialization]
  classroom = options[:classroom]

  if type == 'teacher'
    person = Teacher.new(id, age, specialization, name, parent_permission)
  elsif type == 'student'
    person = Student.new(id, age, classroom, name, parent_permission)
  else
    puts 'Invalid person type.'
    return
  end

  people << person
  puts "Created a new #{type.capitalize}: ID: #{id}, Name: #{name}, Age: #{age}"
end

# Method to create a book
def create_book(books, title, author)
  book = Book.new(title, author)
  books << book
  puts "Created a new book: Title: #{title}, Author: #{author}"
end

# Method to create a rental
def create_rental(rentals, book, person)
  rental = Rental.new(book, person)
  rentals << rental
  puts "Rental created: Book Title: #{book.title}, Person ID: #{person.id}"
end

# Method to list all rentals for a given person ID
def list_rentals_for_person(rentals, person_id)
  puts "Rentals for person with ID #{person_id}:"
  rentals_for_person = rentals.select { |rental| rental.person.id == person_id }
  rentals_for_person.each do |rental|
    puts "Book: #{rental.book.title}"
  end
end

# Example usage
create_book(books, 'Book 1', 'Author 1')
create_book(books, 'Book 2', 'Author 2')
create_person(people, 'teacher', 1, 35, { name: 'John Doe', parent_permission: true, specialization: 'Math' })
# create_person(people, 'teacher', 1, 35, 'John Doe', true, 'Math')
create_person(people, 'student', 2, 16,
              { name: 'Alice Smith', parent_permission: true, classroom: 'Class A' })
create_rental(rentals, books[0], people[0])
list_all_books(books)
list_all_people(people)
list_rentals_for_person(rentals, 1)
