class CreateChirps < ActiveRecord::Migration
  def change
    create_table :chirps do |t|
      t.string :chirp

      t.timestamps null: false
    end
  end
end
