class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :firstname_kana, presence: true
  validates :lastname_kana, presence: true
  validates :birthday, presence: true
  # validates :encrypted_password, presence: true, length: {minimum: 6}

  with_options presence: true do
    # ひらがな、カタカナ、漢字のみ許可する
    validates :firstname, :lastname, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
    # カタカナのみ許可する
    validates :firstname_kana, :lastname_kana,
              format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Input half-width characters.'
  end
end
