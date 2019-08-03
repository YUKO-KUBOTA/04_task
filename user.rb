class User < ApplicationRecord
  #以下の解説：presence: true　は空白でない場合trueという意味
  validates :name, presence: true, length: { maximum: 15 }
    #上記Rails 04　課題:名前の長さに15文字まで許可の制限を追加する
    
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, presence: true,
                       format: {with: VALID_EMAIL_REGEX}
    #上記Rails 04　課題:メールアドレスの正規表現を追加してください,最低限「~ @ ~ . ~」の形を許可

  has_secure_password
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/
  validates :password, presence: true, 
                       length: { minimum: 8, maximum: 32 },
                       format: { with: VALID_PASSWORD_REGEX}
    #上記Rails 04　課題:パスワードの文字数を8~32文字のみ可能にしてください
    #上記Rails 04　課題:パスワードをアルファベット、数字の混合のみ可能にしてください,アルファベットと数字はそれぞれ1文字以上
  
end