class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.integer :lesson_plan_id
      t.string :value

      t.timestamps
    end
  end
end
