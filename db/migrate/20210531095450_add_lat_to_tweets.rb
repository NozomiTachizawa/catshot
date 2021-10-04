class AddLatToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :lat, :float # latカラム -> 緯度
  end
end
