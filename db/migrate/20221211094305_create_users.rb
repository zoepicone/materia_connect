class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :users, id: :uuid do |t|
      t.string :provider
      t.string :uid
      t.string :username
      t.string :email

      t.timestamps
    end
    add_reference :mods, :user, type: :uuid, null: false, foreign_key: true
  end
end
