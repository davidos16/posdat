class AddOmniauthStatusToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :omniauth_status, :boolean
    add_column :users, :omniauth_type, :string
  end
end
