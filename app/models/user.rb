class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy # 1人のユーザーが複数の投稿可能
  has_many :likes, dependent: :destroy # 1人のユーザーが複数の投稿へのいいね可能
  has_many :liked_tweets, through: :likes, source: :tweet
  has_many :comments, dependent: :destroy # 1人のユーザーが複数の投稿へのコメント可能
  has_many :tweets, dependent: :destroy
  validates :name,presence: true # ユーザーネーム必須
  validates :profile, length: { maximum: 200 } # プロフィール最大200文字

  def already_liked?(tweet) # 既にいいねしているかの判定
    self.likes.exists?(tweet_id: tweet.id)
  end

end
