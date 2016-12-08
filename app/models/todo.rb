class Todo < ApplicationRecord

  belongs_to :task

  scope :list, lambda {|query| where(["task_id = ?", "#{query}"]) }
  scope :sorted, lambda { order("created_at ASC") }
  scope :newest_first, lambda { order("created_at DESC") }

end
