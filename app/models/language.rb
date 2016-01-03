class Language < ActiveRecord::Base

	has_many :user_languages

	has_many :students,
			through: :user_languages,
			source: :user

	has_many :words,
			 class_name: "Word",
			foreign_key: :translation_language_id,
			dependent: :destroy

	validates :name,
			  presence: true,
			  uniqueness: {
			  	case_sensitive: false
			  }

end