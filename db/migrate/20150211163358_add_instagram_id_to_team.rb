class AddInstagramIdToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :instagram_id, :integer
  end
end
