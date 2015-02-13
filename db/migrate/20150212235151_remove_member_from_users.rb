class RemoveMemberFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :member, :string
  end
end
