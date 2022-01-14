class CreateWidgets < ActiveRecord::Migration[6.1]
  def change
    create_table :widgets do |t|
      t.string :name
      t.datetime :count_down
      t.text :message
      t.boolean :active
      t.string :button
      t.integer :design
      t.string :type
      t.datetime :expire
      t.boolean :cookie_track
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
