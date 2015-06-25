class AddDistanceToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :distance, :float
  end
end
