class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  encrypts :email, deterministic: true

  has_many :link_lists, dependent: :destroy

  def obfuscated_email
    local, domain = email.split("@")
    local[1..] = "*" * (local.length - 2) + local[local.length - 1]
    domain = domain.split(".").map { |part| "*" * part.length }.join(".")
    "#{local}@#{domain}"
  end
end
