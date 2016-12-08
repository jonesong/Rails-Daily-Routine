class User < ApplicationRecord

  has_secure_password

  has_many :projects
  has_and_belongs_to_many :programs

  scope :sorted, lambda { order('username ASC, first_name ASC, last_name ASC')}

  def name
    "#{first_name} #{last_name}"
    # Or: first_name + ' ' + last_name
    # Or: [first_name, last_name].join(' ')
  end

end
