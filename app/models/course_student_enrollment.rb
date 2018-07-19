class CourseStudentEnrollment <ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  def slug
    "#{[user.slug, course.slug].join('-')}"
  end

end
