class RemoveConfirm < ActiveRecord::Migration[7.0]
  def change
    remove_columns :users, :confirmed_at, :confirmation_sent_at, :confirmation_token, :unconfirmed_email
  end
end
