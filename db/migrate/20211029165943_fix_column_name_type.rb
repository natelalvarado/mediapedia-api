class FixColumnNameType < ActiveRecord::Migration[6.1]
  def change
    rename_column :media, :media, :type
  end
end
