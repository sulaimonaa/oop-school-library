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
  option_handlers = {
    1 => -> { list_all_books(books) },
    2 => -> { list_all_people(people) },
    3 => -> { create_person_menu(people) },
    4 => -> { create_book_menu(books) },
    5 => -> { create_rental_menu(people, books, rentals) },
    6 => -> { list_rentals_menu(people, rentals) },
    7 => -> { quit },
    default: -> { invalid_option }
  }

  option_handlers[option] || option_handlers[:default].call
end

def quit
  puts 'Goodbye!'
  exit
end

def invalid_option
  puts 'Invalid option. Please try again.'
end

def create_person_menu(people)
  # Collect person information and create a person (teacher or student)
  # ...
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
    choice = gets.chomp.to_i
    handle_option(choice, people, books, rentals)
  end
end

main # Call the main method to start the application
