class AddPersonRefToSentences < ActiveRecord::Migration
  def change
    add_reference :sentences, :person, index: true
    add_foreign_key :sentences, :people
  end
end
