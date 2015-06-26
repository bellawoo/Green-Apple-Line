class AddCodeAndLineAndPlatformToTrains < ActiveRecord::Migration
  def change
    change_table :trains do |t|
      t.rename :line, :line_code1
      t.string :line_code2
      t.string :line_code3
      t.string :other_platform
    end
  end
end
