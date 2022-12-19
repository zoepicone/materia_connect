class AddFieldsToMods < ActiveRecord::Migration[7.0]
  def change
    add_column :mods, :approved, :boolean, default: false
    add_column :mods, :unlisted, :boolean, default: false
    add_column :mods, :nsfw, :boolean
    add_column :mods, :premium, :boolean
  end
end
