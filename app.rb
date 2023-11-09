require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

# Initialize data structures
people = []
books = []
rentals = []

# Method to list all books
def list_all_books(books)
  puts "List of Books:"
  books.each do |book|
    puts "Title: #{book.title}, Author: #{book.author}"
  end
end

# Method to list all people
def list_all_people(people)
  puts "List of People:"
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
    person = Teacher.new(id, age, specialization, { name: name, parent_permission: parent_permission })
    elsif type == 'student'
    person = Student.new(id, age, classroom, name, parent_permission)
    else
    puts "Invalid person type."
    return
    end

    people << person
    puts "Created #{type.capitalize}: ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
end

# Method to create a book
def create_book(books, title, author)
  book = Book.new(title, author)
  books << book
  puts "Created Book: Title: #{book.title}, Author: #{book.author}"
end

# Method to create a rental
def create_rental(people, books, rentals, person_id, book_title, date)
  person = people.find { |p| p.id == person_id }
  book = books.find { |b| b.title == book_title }

  if person.nil?
    puts "Person with ID #{person_id} not found."
  elsif book.nil?
    puts "Book with title '#{book_title}' not found."
  else
    rental = Rental.new(person, book, date)
    rentals << rental
    puts "Created Rental: Person ID: #{person.id}, Book Title: #{book.title}, Date: #{rental.date}"
  end
end

# Method to list all rentals for a given person ID
def list_rentals_for_person(rentals, person_id)
  puts "Rentals for Person ID #{person_id}:"
  person_rentals = rentals.select { |rental| rental.person.id == person_id }
  person_rentals.each do |rental|
    puts "Book Title: #{rental.book.title}, Date: #{rental.date}"
  end
end
