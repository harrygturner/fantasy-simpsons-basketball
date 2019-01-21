class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :team_id
      t.integer :team_id_2
      t.integer :baskets_team_1
      t.integer :baskets_team_2
      t.integer :man_of_match

      t.timestamps
    end
  end
end
