class RecreateRatings < ActiveRecord::Migration
  def up
    drop_table :ratings

    create_table :ratings do |t|
      t.integer :lesson_plan_id
      t.integer :author_id
      t.integer :rating

      t.timestamps
    end
  end

  def down
  end
end
