class AddUniqConstrainsTestResults < ActiveRecord::Migration[6.1]
  def change
    add_index :test_results, [:test_id, :user_id], unique: true
  end
end
