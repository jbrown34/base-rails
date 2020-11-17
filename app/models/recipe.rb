# == Schema Information
#
# Table name: recipes
#
#  id              :integer          not null, primary key
#  cook_duration   :string
#  description     :string
#  ingredient2     :string
#  main_ingredient :string
#  name            :string
#  prep_duration   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
class Recipe < ApplicationRecord
  has_many(:likes, { :class_name => "Like", :foreign_key => "recipe_id", :dependent => :destroy })

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
end
