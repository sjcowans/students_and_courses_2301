require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do
  it 'exists' do
    gradebook = Gradebook.new("Professor Cowans")    
    
    expect(gradebook).to be_a(Gradebook)
  end
  it 'can list students' do
    course1 = Course.new("Fluid Dynamics", 10)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student4 = Student.new({name: "Joe", age: 21})
    student3 = Student.new({name: "Sam", age: 29})
    course1.enroll(student1)
    course1.enroll(student2)
    course1.enroll(student3)
    course1.enroll(student4)
    gradebook = Gradebook.new("Professor Cowans")  
    gradebook.add_course(course1)  

    expect(gradebook.list_all_students).to eq({"#{course1}"=>[student1, student2, student3, student4]})
  end

  it 'can list students below a grade' do
    gradebook = Gradebook.new("Professor Cowans")    
    course1 = Course.new("Fluid Dynamics", 10)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student4 = Student.new({name: "Joe", age: 21})
    student3 = Student.new({name: "Sam", age: 29})
    course1.enroll(student1)
    course1.enroll(student2)
    course1.enroll(student3)
    course1.enroll(student4)
    student1.log_score(89)
    student2.log_score(89)
    student3.log_score(69)
    student4.log_score(59)
    gradebook = Gradebook.new("Professor Cowans")  
    gradebook.add_course(course1)  

    expect(gradebook.students_below(70)).to eq([student3, student4])
  end
end