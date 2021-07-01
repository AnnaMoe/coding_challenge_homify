class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.references :campaign, null: false, foreign_key: true
      t.references :expert, foreign_key: { to_table: :users }
      t.references :novice, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
