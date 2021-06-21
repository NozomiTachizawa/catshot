class AddKenToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :ken, :string
  end
end
