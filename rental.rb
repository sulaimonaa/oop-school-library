class Rental
  attr_accessor :book, :person

  def initialize(book, person)
    @book = book
    @person = person
  end
end
