class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = [] # Initialize an empty array to store students
  end

  # Add a student to the classroom
  def add_student(student)
    @students << student
    student.classroom = self # Set the classroom for the student
  end
end
