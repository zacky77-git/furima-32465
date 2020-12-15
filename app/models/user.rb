class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  with_options presence: true do
    validates :nickname,  length: {maximum: 40 }
    validates :birthday
    with_options  format: { with: /\A[ァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
      validates :first_name_kanzi
      validates :family_name_kanzi
    end
    with_options  format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナを使用してください' } do
      validates :first_name_kana
      validates :family_name_kana
    end
  end
end
