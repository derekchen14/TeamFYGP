class CreateLessonPlans < ActiveRecord::Migration
  def change
    create_table :lesson_plans do |t|
      t.string :tags
      t.integer :grade
      t.string :subject
      t.integer :length
      t.string :difficulty
      t.string :content

      t.timestamps
    end
  end
end
