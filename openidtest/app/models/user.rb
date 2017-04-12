class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :trackable, :omniauthable, omniauth_providers: %i(google)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  protected

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create(email: data["email"],
                         name:     access_token.info.name,
                         provider: access_token.provider,
                         uid:      access_token.uid,
                         token:    access_token.credentials.token,
                         password: Devise.friendly_token[0, 20],
                         meta:     access_token.to_yaml)
    end
    user
  end
end
