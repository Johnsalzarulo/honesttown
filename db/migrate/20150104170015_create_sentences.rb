class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :subject
      t.string :verb
      t.string :adjective
    end
  end
end
