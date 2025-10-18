class LinkList < ApplicationRecord
  belongs_to :user
  has_many :links, dependent: :destroy

  encrypts :name

  validates :name, presence: true
end
