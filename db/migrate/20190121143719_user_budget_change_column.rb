class UserBudgetChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :budget, :integer, default: "100"
  end
end
