class CreateTeamPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :team_players do |t|
      t.integer :team_id
      t.integer :player_id
      t.integer :rating
      t.integer :matchbaskets
      t.integer :totalbaskets

      t.timestamps
    end
  end
end
