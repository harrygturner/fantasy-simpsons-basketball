class TeamPlayerChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :team_players, :totalbaskets, :integer, default: "0"
  end
end
