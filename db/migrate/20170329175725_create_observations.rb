class CreateObservations < ActiveRecord::Migration[5.0]
  def change
    create_table :observations do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.time :time
      t.text :conditions
      t.time :sunrise
      t.time :sunset
      t.text :species
      t.boolean :saw
      t.boolean :heard
      t.float :latitude
      t.float :longitude
      t.text :notes

      t.timestamps
    end
  end
end
