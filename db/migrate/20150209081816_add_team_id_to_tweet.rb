class AddTeamIdToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :team_id, :integer
  end
end
