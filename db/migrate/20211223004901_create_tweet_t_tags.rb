class CreateTweetTTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_t_tags do |t|
      t.references :tweet, foreign_key: true
      t.references :t_tag, foreign_key: true
      t.timestamps
    end
  end
end
