class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration
      t.time :start_time
      t.date :date
      t.integer :movie_id

      t.timestamps
    end
  end
end
