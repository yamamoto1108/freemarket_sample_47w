class User < ApplicationRecord
  has_many :bought_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :likes
  has_many :comments
  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :creditcard, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        nickname:     auth.info.name,
        avatar_image: auth.info.image,
        uid:          auth.uid,
        provider:     auth.provider,
        email:        User.dummy_email(auth),
        password:     Devise.friendly_token[0, 20]
      )
    end
    user
  end

  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
