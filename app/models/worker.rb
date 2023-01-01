class Worker < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :dept, presence: true

end
