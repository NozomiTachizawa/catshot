class AddCityToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :city, :string
  end
end
