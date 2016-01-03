class AddLanguagesToWords < ActiveRecord::Migration
  def change
    add_reference :words, :primary_language, index: true, foreign_key: true
    add_reference :words, :translation_language, index: true, foreign_key: true
  end
end
