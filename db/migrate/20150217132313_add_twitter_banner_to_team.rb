class AddTwitterBannerToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :twitter_banner, :string
  end
end
