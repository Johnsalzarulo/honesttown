class Person < ActiveRecord::Base
	has_many :sentences
	validates_uniqueness_of :name, :scope => [:location]

	include PgSearch

	multisearchable :against => [:name, :location]

	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :name,
      [:name, :location]
    ]
  end

end
