class CourseInstructorRelationship <ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  def slug
    "#{[user.slug, course.slug].join('-')}"
  end

end
