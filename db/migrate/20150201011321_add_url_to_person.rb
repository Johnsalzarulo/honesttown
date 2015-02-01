class AddUrlToPerson < ActiveRecord::Migration
  def change
  	add_column(:people, :url, :string)
  end
end
