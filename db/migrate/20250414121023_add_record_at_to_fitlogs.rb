class AddRecordAtToFitlogs < ActiveRecord::Migration[8.0]
  def change
    add_column :fitlogs, :record_at, :date
    add_index :fitlogs, %w[user_id record_at], unique: true
  end
end
