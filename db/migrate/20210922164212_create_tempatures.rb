class CreateTempatures < ActiveRecord::Migration[5.2]
  def change
    create_table :tempatures do |t|
      t.date :date
      t.integer :time
      t.integer :temp
      t.integer :high
      t.integer :low

      t.timestamps
    end
  end
end
