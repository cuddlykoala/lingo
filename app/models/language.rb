class Language < ActiveRecord::Base

	has_many :user_languages

	has_many :students,
			through: :user_languages,
			source: :user

	validates :name,
			  presence: true,
			  uniqueness: {
			  	case_sensitive: false
			  }

end