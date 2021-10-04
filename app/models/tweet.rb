class Tweet < ApplicationRecord
    belongs_to :user # 一つの投稿は1人のユーザーに帰属
    mount_uploader :image, ImageUploader # 画像投稿
    mount_uploader :video, ImageUploader # 動画投稿
    has_many :likes, dependent: :destroy # 1投稿にいいね複数可
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy # 1投稿にコメント複数可
    validates :body, {presence: true} # 本文必須
    validates :image, {presence: true} # 画像 or 動画必須
    validates :city, {presence: true} # ネコがいた場所必須

end
