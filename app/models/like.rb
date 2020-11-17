# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :integer
#  user_id    :integer
#
class Like < ApplicationRecord
  belongs_to(:recipe, { :required => false, :class_name => "Recipe", :foreign_key => "recipe_id" })
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
end
