class Student
  attr_reader :name, :scores, :age
  def initialize(student_info)
    @name = student_info[:name]
    @age = student_info[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end

  def grade
    (scores.sum).div(scores.length)
  end
end
