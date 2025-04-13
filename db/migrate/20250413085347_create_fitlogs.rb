class CreateFitlogs < ActiveRecord::Migration[8.0]
  def change
    create_table :fitlogs do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :weight, null: false, precision: 4, scale: 1, comment: '体重'  # 最大値 999.9 まで扱える設定例
      t.decimal :body_fat, precision: 3, scale: 1, comment: '体脂肪率'  # 最大値 99.9 まで扱える設定例
      t.decimal :muscle, precision: 4, scale: 1, comment: '筋肉量'  # 最大値 999.9 まで扱える設定例
      t.decimal :bmr, precision: 5, scale: 1, comment: '基礎代謝量'  # 最大値 9999.9 まで扱える設定例
      t.integer :body_age, comment: '体年齢'  # 最大値 999 まで扱える設定例
      t.text :memo, comment: 'メモ'

      t.timestamps
    end
  end
end
