class WordType < ActiveRecord::Base
	has_many :words

	validates :name,
			uniqueness: { 
				case_sensitive: false
			}
end