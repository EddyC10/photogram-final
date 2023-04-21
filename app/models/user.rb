# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  comments_count  :integer
#  email           :string
#  likes_count     :integer
#  password_digest :string
#  private         :boolean
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many :photos, :class_name => "Photo", :foreign_key => "owner_id"
  has_many :follow_requests, :class_name => "FollowRequest", :foreign_key => "recipient_id"
  has_many :likes, :class_name => "Like", :foreign_key => "fan_id"
  has_many :comments, :class_name => "Comment", :foreign_key => "author_id"

  # def follow_requests
  #   id = self.id

  #   user = FollowRequest.where({ :recipient_id => id }).at(0)
  # end

  # def photos
  #   id = self.id
  #   photos = Photo.where({ :owner_id => id }).at(0)
  # end

  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

end
