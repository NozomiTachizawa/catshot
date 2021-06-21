class AddLngToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :lng, :float
  end
end
