class AddStatusToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :status, :integer, default: 0 
  end
end
