class AddIndexToMicroposts < ActiveRecord::Migration[7.0]
  def change
    # adds indexing to microposts
    add_index :microposts, [:user_id, :created_at]
  end
end
