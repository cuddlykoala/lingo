class AddPrimaryLanguageToUser < ActiveRecord::Migration
  def change
    add_reference :users, :primary_language, index: true, foreign_key: true
  end
end
