class DropCourseStudentEnrollmentTable < ActiveRecord::Migration
  def change
    drop_table :course_student_enrollment
  end
end
