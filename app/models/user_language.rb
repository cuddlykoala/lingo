class UserLanguage < ActiveRecord::Base
  belongs_to :user
  belongs_to :language

  validates :user,
  			presence: true

  validates :language, 
  			presence: true,
  			uniqueness: {
  				scope: :user
  			}
end
