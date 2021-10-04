class Comment < ApplicationRecord
  belongs_to :user # 一つのコメントは1人のユーザーに帰属
  belongs_to :tweet # 一つのコメントは一つの投稿に帰属
  validates :content, {presence: true, length: {maximum:140}} # 本文必須、140字以内
end
