class AddActivityTrackingToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :total_logins, :integer
    add_column :users, :last_logged_in_at, :datetime
  end
end
