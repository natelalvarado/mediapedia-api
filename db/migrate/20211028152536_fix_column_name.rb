class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :media, :media_type, :media
  end
end
