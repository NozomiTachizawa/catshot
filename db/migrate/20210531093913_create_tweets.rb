class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t| # tweetsテーブル
      t.text :body # bodyカラム -> 本文
      t.string :video # videoカラム -> 動画
      t.string :spot
      t.timestamps
    end
  end
end
