class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :image
      t.string :catchphrase
      t.integer :baserating
      t.integer :height

      t.timestamps
    end
  end
end
