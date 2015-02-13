class AddSentencesRefToTweets < ActiveRecord::Migration
  def change
  	add_reference :tweets, :sentence, index: true
    add_foreign_key :tweets, :sentences
  end
end
