class DropCourseUsers < ActiveRecord::Migration
  def change
    drop_table :course_users
  end
end
