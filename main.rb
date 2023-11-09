# Add your requires for classes here
require_relative 'app'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

# Initialize data structures
people = []
books = []
rentals = []

# Define the main method
def main(books, people, rentals)
  loop do
    puts "School Library App"
    puts "Choose an option:"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List rentals for a person"
    puts "7. Quit"

    choice = gets.chomp.to_i

    case choice
    when 1
      list_all_books(books)
    when 2
      list_all_people(people)
    when 3
      create_person_menu(people)
    when 4
      create_book_menu(books)
    when 5
      create_rental_menu(people, books, rentals)
    when 6
      list_rentals_menu(rentals, people)
    when 7
      puts "Exiting the app. Goodbye!"
      break
    else
      puts "Invalid option. Please choose a valid option."
    end
  end
end

def create_person_menu(people)
    print "Enter person type (teacher/student): "
    person_type = gets.chomp.downcase

    print "Enter ID: "
    id = gets.chomp.to_i

    print "Enter age: "
    age = gets.chomp.to_i

    print "Enter name (optional): "
    name = gets.chomp

    print "Parent permission (true/false, optional): "
    parent_permission = gets.chomp.downcase == 'true'

    if person_type == 'teacher'
    print "Enter specialization: "
    specialization = gets.chomp
    create_person(people, person_type, id, age, { specialization: specialization, name: name, parent_permission: parent_permission })
    elsif person_type == 'student'
    print "Enter classroom: "
    classroom = gets.chomp
    create_person(people, person_type, id, age, { classroom: classroom, name: name, parent_permission: parent_permission })
    else
    puts "Invalid person type."
    end
end

def create_book_menu(books)
    print "Enter book title: "
    title = gets.chomp

    print "Enter book author: "
    author = gets.chomp

    create_book(books, title, author)
end

# Define the create_rental_menu method
def create_rental_menu(people, books, rentals)
  loop do
    puts "Create a Rental"
    puts "Choose a person to rent a book:"
    list_all_people(people)
    puts "Enter the Person's ID (or type 'back' to return to the main menu):"
    
    person_id_input = gets.chomp
    break if person_id_input == 'back'

    person_id = person_id_input.to_i
    person = people.find { |p| p.id == person_id }

    if person.nil?
      puts "Person with ID #{person_id} not found."
      next
    end

    puts "Choose a book to rent:"
    list_all_books(books)
    puts "Enter the Book's Title (or type 'back' to return to the main menu):"
    
    book_title = gets.chomp
    break if book_title == 'back'

    book = books.find { |b| b.title == book_title }

    if book.nil?
      puts "Book with title '#{book_title}' not found."
      next
    end

    puts "Enter the rental date (e.g., '2023-11-07'):"

    rental_date = gets.chomp

    create_rental(people, books, rentals, person_id, book_title, rental_date)
  end
end

# Run the main method when the script is executed
main(books, people, rentals)
