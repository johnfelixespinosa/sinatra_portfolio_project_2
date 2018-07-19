class CreateCourseStudentEnrollments < ActiveRecord::Migration
  def change
    create_table :course_student_enrollments do |t|
      t.integer :course_id
      t.integer :user_id
    end
  end
end
