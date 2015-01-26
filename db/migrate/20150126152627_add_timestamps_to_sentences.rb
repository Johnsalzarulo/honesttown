class AddTimestampsToSentences < ActiveRecord::Migration
  def change
      add_column(:sentences, :created_at, :datetime)
      add_column(:sentences, :updated_at, :datetime)
  end
end
