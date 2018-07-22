class CourseStudentEnrollment <ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  has_many :students,:through => :course_student_enrollments, class_name: :user


  def slug
    "#{[user.slug, course.slug].join('-')}"
  end

end
