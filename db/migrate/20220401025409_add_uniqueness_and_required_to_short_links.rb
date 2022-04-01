class AddUniquenessAndRequiredToShortLinks < ActiveRecord::Migration[7.0]
  def change
    change_column_null :short_links, :full_url, false
    change_column_null :short_links, :short_link, false

    add_index :short_links, :full_url, unique: true
    add_index :short_links, :short_link, unique: true
  end
end
