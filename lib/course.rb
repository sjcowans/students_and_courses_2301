class Course
  attr_reader :name, :capacity, :students

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @students = []
  end
  
  def full?
    if @students.length <= 1
      false
    else
      true
    end
  end

  def enroll(student)
    if @students.length <= capacity
      @students << student
    else
      p "Course full"
    end
  end
end
