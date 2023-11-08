require_relative 'person'

class Student < Person
  attr_accessor :name
  attr_reader :classroom

  def initialize(id, age, classroom, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom&.students&.delete(self) # Remove student from the current classroom if they have one
    @classroom = classroom
    classroom&.students&.<< self # Add the student to the new classroom
  end
end
