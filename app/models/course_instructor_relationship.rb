class CourseInstructorRelationship <ActiveRecord::Base
  belongs_to :instructor
  belongs_to :course

  def slug
    "#{[user.slug, course.slug].join('-')}"
  end

end
