class CreateMods < ActiveRecord::Migration[7.0]
  def change
    create_table :mods do |t|
      t.string :title
      t.text :description
      t.string :tags
      t.string :download_url

      t.timestamps
    end
  end
end
