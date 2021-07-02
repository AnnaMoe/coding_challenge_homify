class AddNameToTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :name, :string
  end
end
