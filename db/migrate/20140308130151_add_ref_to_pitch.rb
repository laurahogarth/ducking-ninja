class AddRefToPitch < ActiveRecord::Migration
  def change
    add_column :pitches, :ref, :string
  end
end
