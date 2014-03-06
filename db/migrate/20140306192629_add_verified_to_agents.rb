class AddVerifiedToAgents < ActiveRecord::Migration
  def change
    add_column :agents, :verified, :boolean, default: false
  end
end
