class FixColumnNameType3 < ActiveRecord::Migration[6.1]
  def change
    rename_column :media, :type, :category
  end
end
