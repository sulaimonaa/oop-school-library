require_relative 'app' # Assuming you have defined the app logic in another file

def display_menu
  puts 'Library Management System'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person (teacher or student)'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Quit'
end

def handle_option(option, people, books, rentals)
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
    list_rentals_menu(people, rentals)
  when 7
    quit
  else
    invalid_option
  end
end


def quit
  puts 'Goodbye!'
  exit
end

def invalid_option
  puts 'Invalid option. Please try again.'
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

  # Depending on the person_type, you might need additional information
  if person_type == 'teacher'
    print "Enter specialization: "
    specialization = gets.chomp
    create_person(people, person_type, id, age, name, parent_permission, specialization)
  elsif person_type == 'student'
    print "Enter classroom: "
    classroom = gets.chomp
    create_person(people, person_type, id, age, name, parent_permission, classroom)
  else
    puts "Invalid person type."
  end
end

def create_book_menu(books)
  # Collect book information and create a book
  # ...
end

def create_rental_menu(people, books, rentals)
  # Collect rental information and create a rental
  # ...
end

def list_rentals_menu(people, rentals)
  # List rentals for a person
  # ...
end

def main
  people = [] # Initialize your data structures
  books = []
  rentals = []

  loop do
    display_menu
    print 'Please choose an option: '
    # Get the user's choice from input and store it in the `user_choice` variable
user_choice = gets.chomp.to_i

# Call `handle_option` with the user's choice and the relevant data structures
handle_option(user_choice, people, books, rentals)

    # choice = gets.chomp.to_i
    # handle_option(choice, people, books, rentals)
  end
end

main # Call the main method to start the application
