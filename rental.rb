class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date
  end
end
