class DeleteColumnsFromTodos < ActiveRecord::Migration[6.0]
  def change
    remove_column :todos, :expert, :reference
    remove_column :todos, :novice, :reference
  end
end
