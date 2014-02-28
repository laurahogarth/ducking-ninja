class AddOpenToHolidays < ActiveRecord::Migration
  def change
    add_column :holidays, :open, :boolean, default: true
  end
end
