class RecreateLessonPlans < ActiveRecord::Migration
  def up
    drop_table :lesson_plans

    create_table :lesson_plans do |t|
      t.string :name
      t.string :subject
      t.string :description
      t.integer :author_id

      t.timestamps
    end
  end

  def down
  end
end
