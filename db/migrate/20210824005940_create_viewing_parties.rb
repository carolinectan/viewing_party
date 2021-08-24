class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration
      t.date :date
      t.time :start_time
      t.integer :movie_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
