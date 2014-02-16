class AddSeenToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :seen, :boolean, default: false 
  end
end
