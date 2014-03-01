class CreateFavouriteCountries < ActiveRecord::Migration
  def change
    create_table :favourite_countries do |t|
      t.references :country
      t.references :agent

      t.timestamps
    end
  end
end
