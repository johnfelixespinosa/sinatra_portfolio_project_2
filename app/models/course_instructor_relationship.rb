class CourseInstructorRelationship <ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  has_one :teacher, :through => :course_instructor_relationship, :class_name => 'User'

  def slug
    "#{[user.slug, course.slug].join('-')}"
  end

end
