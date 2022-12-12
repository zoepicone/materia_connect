class CreateAuthorisations < ActiveRecord::Migration[7.0]
  def change
    create_table :authorisations do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id

      t.timestamps
    end
  end
end
