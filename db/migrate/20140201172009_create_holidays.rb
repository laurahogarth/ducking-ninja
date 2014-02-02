class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.references :traveller
      t.references :country
      t.string :region
      t.integer :nights
      t.date :earliest_date
      t.date :latest_date
      t.float :budget
      t.boolean :ballpark, :default => true
      t.integer :adults, :default => 2
      t.integer :children, :default => 0
      t.boolean :include_travel, :default => true
      t.text :description

      t.timestamps
    end
  end
end
