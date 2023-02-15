class Gradebook
  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def list_all_students
    all_students = Hash.new
    @courses.each do |course|
    all_students["#{course}"] = course.students
    end
    all_students
  end

  def add_course(course)
    @courses << course
  end

  def students_below(threshold)
    students_below = []
    @courses.each do |course|
      course.students.each do |student|
        if student.grade < threshold
          students_below << student
        end
      end
    end
    students_below
  end

  def all_grades
    all_grades = []
    @courses.each do |course|
      course.students.each do |student|
        all_grades << student.grade
      end
    end
    all_grades
    #need to refactor log grade to only add grade to specific class
    #but ran out of time
  end
end
