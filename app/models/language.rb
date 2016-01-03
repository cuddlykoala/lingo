class Language < ActiveRecord::Base

	has_many :user_languages

	has_many :students,
			through: :user_languages,
			source: :user

	has_many :words,
			foreign_key: :translation_language_id

	validates :name,
			  presence: true,
			  uniqueness: {
			  	case_sensitive: false
			  }

end