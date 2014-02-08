class CreateAgentDetails < ActiveRecord::Migration
  def change
    create_table :agent_details do |t|
      t.references :agent
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :town
      t.string :county
      t.string :postcode
      t.string :email
      t.string :main_phone
      t.string :alt_phone
      t.string :fax
      t.string :website
      t.string :managers_name
      t.string :opening_hours
      t.text :description

      t.timestamps
    end
  end
end
