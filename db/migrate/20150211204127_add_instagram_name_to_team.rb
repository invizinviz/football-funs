class AddInstagramNameToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :instagram_name, :string
  end
end
