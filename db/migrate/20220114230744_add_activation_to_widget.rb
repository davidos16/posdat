class AddActivationToWidget < ActiveRecord::Migration[6.1]
  def change
    add_column :widgets, :activation, :string
  end
end
