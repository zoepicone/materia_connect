class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :uid, uniqueness: { scope: :provider }
  validates :username, presence: true, uniqueness: true

  def self.find_or_create_by_auth(auth_data)
    # TODO: Check if the provider already exists, so we don't add it twice
    puts(auth_data)
    user = User.find_or_create_by(provider: auth_data['provider'], uid: auth_data['uid'])

    user.name ||= auth_data['info']['name']
    user.email ||= auth_data['info']['email']
    user.username ||= "#{user.name}_#{auth_data['uid']}".downcase.parameterize(separator: '_')

    user.save!
    user
  end
end

