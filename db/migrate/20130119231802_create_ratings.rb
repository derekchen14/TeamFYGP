class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rater_id
      t.integer :rated_id
      t.integer :rating
      t.string :type

      t.timestamps
    end
  end
end
