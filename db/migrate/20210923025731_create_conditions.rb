class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.string :date_time
      t.string :temp_c
      t.string :temp_f
      t.string :weather_code
      t.string :icon
      t.string :desc
      t.string :windspeed_mph
      t.string :windspeed_kmph
      t.string :winddir_degree
      t.string :winddir_point
      t.string :precip_mm
      t.string :precip_in
      t.string :humidity
      t.string :visibility
      t.string :visibility_miles
      t.string :pressure
      t.string :pressure_in
      t.string :cloud_cover
      t.string :feels_like_c
      t.string :feels_like_f
      t.string :uv

      t.timestamps
    end
  end
end
