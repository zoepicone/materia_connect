class CreateMods < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :mods, id: :uuid do |t|
      t.string :title
      t.text :description
      t.string :tags, array: true, default: []
      t.string :download_url

      t.timestamps
    end
  end
end
