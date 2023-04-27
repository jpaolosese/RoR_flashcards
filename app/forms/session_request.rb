class SessionRequest

  include ActiveModel::Model
  attr_accessor :email, :password

  validates :email, presence: true
  validates :password, presence: true

  def authenticate
    return nil unless valid?
    user = User.find_by_email(email)
    return nil unless user&.authenticate(password)
    user
  end
end