class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, length: { minimum: 6}, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: 
    /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
  validates :password, length: { minimum: 6}, allow_nil: true
  enum usertype: [:student, :instructor]
  after_initialize :set_default_usertype, :if => :new_record?

  has_many :course_instructor_relationships 
  has_many :instructor_courses, through: :course_instructor_relationships, class_name: "Course", foreign_key: "course_id"

  has_many :course_student_enrollments
  has_many :student_courses, through: :course_student_enrollments, class_name: "Course", foreign_key: "course_id"

  #has_secure_password checks for existence of password and does confirmation

  def set_default_usertype
    self.usertype ||= :student
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

end