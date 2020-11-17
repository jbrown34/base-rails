# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  likes_count     :integer
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  
  has_many(:likes, { :class_name => "Like", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:recipes, { :class_name => "Recipe", :foreign_key => "user_id", :dependent => :destroy })
  
end
