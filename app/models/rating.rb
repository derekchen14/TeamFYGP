class Rating < ActiveRecord::Base
  attr_accessible :rater_id, :rated_id, :rating

  belongs_to :rater, class_name: 'Author'
end
