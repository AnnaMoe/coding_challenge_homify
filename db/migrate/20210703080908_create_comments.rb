class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.references :receiver, polymorphic: true
      t.timestamps
    end
  end
end
