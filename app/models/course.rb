class Course < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :credits, presence: true
  has_one :course_instructor_relationship
  has_one :user, through: :course_instructor_relationship
  
  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Course.all.find{|course| course.slug == slug}
  end
end