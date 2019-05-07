class OauthProvider < ActiveRecord::Base
  belongs_to :user

  validates :uid, :name, presence: true
  validates :uid, uniqueness: { scope: :name }

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, name: auth.provider) do |provider|
      provider.user = User.create_with(name: auth.info.name)
                          .find_or_create_by(email: auth.info.email)
    end
  end
end
