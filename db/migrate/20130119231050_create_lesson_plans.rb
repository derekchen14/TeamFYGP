class CreateLessonPlans < ActiveRecord::Migration
  def change
    drop_table :lesson_plans

    create_table :lesson_plans do |t|
      t.string :name
      t.string :subject
      t.string :description
      t.integer :author_id
      t.string :grade

      t.timestamps
    end
  end
end
