class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :username
      t.string :email

      t.timestamps
    end
    add_reference :mods, :user, null: false, foreign_key: true
  end
end
