class CreateRepeaterSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :repeater_searches, id: :uuid do |t|
      t.boolean :band_10m
      t.boolean :band_6m
      t.boolean :band_4m
      t.boolean :band_2m
      t.boolean :band_70cm
      t.boolean :band_23cm

      t.boolean :fm
      t.boolean :dstar
      t.boolean :fusion
      t.boolean :dmr
      t.boolean :nxdn

      t.boolean :geo
      t.integer :distance
      t.string :distance_unit
      t.boolean :coordinates
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
