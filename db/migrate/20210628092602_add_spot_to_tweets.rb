class AddSpotToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :spot, :string
  end
end
