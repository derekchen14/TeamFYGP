class AddDatabaseData < ActiveRecord::Migration
  require 'csv'
  def up
    # Clear up the tables
    Author.delete_all
    Tag.delete_all
    Rating.delete_all
    LessonPlan.delete_all
    Comment.delete_all
    
    # Load the tables
    CSV.open('migration_data/Models_Authors.csv', 'r').each do |row|
      Author.create(:id => row[0], :name => row[1], :login => row[2])
    end
    
    CSV.open('migration_data/Models_Tags.csv', 'r').each do |row|
      Tag.create(:id => row[0], :name => row[1], :lesson_plan_id => row[2])
    end
    
    CSV.open('migration_data/Models_Ratings.csv', 'r').each do |row|
      Rating.create(:id => row[0], :author_id => row[1], :lesson_plan_id => row[2], :rating => row[3])
    end
    
    CSV.open('migration_data/Models_Lesson_Plans.csv', 'r').each do |row|
      LessonPlan.create(:id => row[0], :name => row[1], :subject => row[5], :description => row[2], :author_id => row[4])
    end

    CSV.open('migration_data/Models_Comments.csv', 'r').each do |row|
      Comment.create(:id => row[0], :author_id => row[1], :lesson_plan_id => row[2], :value => row[3])
    end
    
  end

  def down
  end
end
