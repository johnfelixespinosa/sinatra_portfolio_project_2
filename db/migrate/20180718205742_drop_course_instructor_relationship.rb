class DropCourseInstructorRelationship < ActiveRecord::Migration
  def change
    drop_table :course_instructor_relationships
  end
end
