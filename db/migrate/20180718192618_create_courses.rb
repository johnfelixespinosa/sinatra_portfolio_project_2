class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :instructor
      t.string :description
      t.integer :credits
  end
end
end
