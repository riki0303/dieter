class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, comment: '名前'
      t.decimal :height, precision: 4, scale: 1, comment: '身長'
      t.decimal :target_weight, precision: 4, scale: 1, comment: '目標体重'

      t.timestamps
    end
  end
end
