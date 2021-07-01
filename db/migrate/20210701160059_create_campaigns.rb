class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :tags
      t.string :estimated_duration
      t.references :expert, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
