class Task < ApplicationRecord

  belongs_to :project
  has_many :todos
  
  scope :list, lambda {|query| where(["project_id = ?", "#{query}"]) }
  scope :sorted, lambda { order("created_at ASC") }
  scope :newest_first, lambda { order("created_at DESC") }

end
