class CreateCourseInstructorRelationship < ActiveRecord::Migration
  def change
    create_table :course_instructor_relationships do |t|
      t.integer :course_id
      t.integer :user_id
    end
  end
end