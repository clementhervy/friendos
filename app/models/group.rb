class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :expenditures
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  def display_members
    byebug
    @users.map {|u| [u.name].join(' ,')}
  end
end
