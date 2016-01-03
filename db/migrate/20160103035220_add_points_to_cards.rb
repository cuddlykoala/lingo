class AddPointsToCards < ActiveRecord::Migration
  def change
    add_column :cards, :points, :integer
  end
end
