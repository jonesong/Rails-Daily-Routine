class Project < ApplicationRecord

  belongs_to :user
  has_many :tasks

  scope :list, lambda {|query| where(["user_id = ?", "#{query}"]) }
  scope :sorted, lambda { order("created_at ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :sorted_by_name, lambda { order("name ASC") }

  validates_presence_of :name

end
