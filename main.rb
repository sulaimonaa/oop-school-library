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

# Define the display_menu method
def display_menu
  puts 'School Library App'
  puts 'Choose an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Quit'
end

# Define the choice_option method
def choice_option(option, books, people, rentals)
  case option
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
  else
    puts 'Invalid option. Please choose a valid option.'
  end
end

# Define the main method
def main(books, people, rentals)
  puts 'Welcome to School Library App'

  loop do
    display_menu
    option = gets.chomp.to_i
    if option == 7
      puts 'Exiting the app. Goodbye!'
      break
    else
      choice_option(option, books, people, rentals)
    end
  end
end

def create_rental_menu(people, books, rentals)
  loop do
    puts 'Create a Rental'
    person_id = choose_person(people)
    break if person_id == 'back'

    book_title = choose_book(books)
    break if book_title == 'back'

    date = enter_rental_date

    create_rental(people, books, rentals, person_id.to_i, book_title, date)
  end
end

def choose_person(people)
  puts 'Choose a person to rent a book:'
  list_all_people(people)
  puts "Enter the Person's ID (or type 'back' to return to the main menu):"
  gets.chomp
end

def choose_book(books)
  puts 'Choose a book to rent:'
  list_all_books(books)
  puts "Enter the Book's Title (or type 'back' to return to the main menu):"
  gets.chomp
end

def enter_rental_date
  puts "Enter the rental date (e.g., '2023-11-07'):"
  gets.chomp
end

# Define the create_person_menu method
def create_person_menu(people)
  person_type = enter_person_type
  id = enter_id
  age = enter_age
  name = enter_name
  parent_permission = enter_parent_permission

  case person_type
  when 'teacher'
    specialization = enter_specialization
    create_person(people, person_type, id, age,
                  { specialization: specialization, name: name, parent_permission: parent_permission })
  when 'student'
    classroom = enter_classroom
    create_person(people, person_type, id, age,
                  { classroom: classroom, name: name, parent_permission: parent_permission })
  else
    puts 'Invalid person type.'
  end
end

def enter_person_type
  print 'Enter person type (teacher/student): '
  gets.chomp.downcase
end

def enter_id
  print 'Enter ID: '
  gets.chomp.to_i
end

def enter_age
  print 'Enter age: '
  gets.chomp.to_i
end

def enter_name
  print 'Enter name (optional): '
  gets.chomp
end

def enter_parent_permission
  print 'Parent permission (true/false, optional): '
  gets.chomp.downcase == 'true'
end

def enter_specialization
  print 'Enter specialization: '
  gets.chomp
end

def enter_classroom
  print 'Enter classroom: '
  gets.chomp
end

# Define the create_book_menu method
def create_book_menu(books)
  print 'Enter book title: '
  title = gets.chomp

  print 'Enter book author: '
  author = gets.chomp

  create_book(books, title, author)
end

# Run the main method when the script is executed
main(books, people, rentals)
