class Link < ApplicationRecord
  belongs_to :link_list

  encrypts :link
  encrypts :name

  validates :link, presence: true
  validate :validate_url

  private
  def validate_url
    errors.add(:link, "Provided URL is not valid") unless url_valid?
  end

  def url_valid?
    uri = URI.parse(self.link)
    uri.is_a?(URI::HTTP) && uri&.host.present?
  rescue URI::InvalidURIError
    false
  end
end
