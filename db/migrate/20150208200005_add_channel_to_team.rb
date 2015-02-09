class AddChannelToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :channel, :string
  end
end
