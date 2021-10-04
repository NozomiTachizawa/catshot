class Like < ApplicationRecord
  belongs_to :tweet # 一つのいいねは一つの投稿に帰属
  belongs_to :user # 一つのいいねは1人のユーザーに帰属
  validates_uniqueness_of :tweet_id, scope: :user_id # 一人が一つの投稿に1回しかいいねできないように
end
