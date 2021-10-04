class AddImageToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :image, :string # imageカラム -> 画像
  end
end
