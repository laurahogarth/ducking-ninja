class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.integer :min
      t.integer :max
      t.integer :expertise, default: 0
      t.text :content
      t.references :agent
      t.references :holiday

      t.timestamps
    end
  end
end
