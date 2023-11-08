require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

person1 = Person.new(1, 25, 'Alice', parent_permission: true)
puts "ID: #{person1.id}"
puts "Name: #{person1.name}"
puts "Age: #{person1.age}"
puts person1.can_use_services? ? 'Can use services' : 'Cannot use services'

person2 = Person.new(2, 15, 'Jones', parent_permission: false)
puts "ID: #{person2.id}"
puts "Name: #{person2.name}"
puts "Age: #{person2.age}"
puts person2.can_use_services? ? 'Can use services' : 'Cannot use services'

teacher = Teacher.new(1, 33, specialization: 'Math', name: 'Alice Jones')
puts teacher.id
puts teacher.age
puts teacher.specialization
puts teacher.name
puts teacher.can_use_services

student = Student.new(1, 16, classroom: 'Class A', name: 'Alice Smith')
puts student.id
puts student.age
puts student.classroom
puts student.name
puts student.play_hooky

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
