class AddIndexToMods < ActiveRecord::Migration[7.0]
  def update
    enable_extension 'pg_trgm' unless extension_enabled?('pg_trgm')
    add_index :mods, :tags, using: 'gin'
  end
end
