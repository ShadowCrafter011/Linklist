class Link < ApplicationRecord
  belongs_to :link_list

  encrypts :link
end
