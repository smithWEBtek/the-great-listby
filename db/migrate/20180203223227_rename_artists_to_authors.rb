class RenameArtistsToAuthors < ActiveRecord::Migration[5.1]
  def change
    rename_table :artists, :authors
  end
end
