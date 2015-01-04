class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :location
      t.string :name
      t.string :img_url
      t.string :twitter
      t.string :email
    end
  end
end
