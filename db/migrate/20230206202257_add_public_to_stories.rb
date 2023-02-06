class AddPublicToStories < ActiveRecord::Migration[7.0]
  def change
    add_column :stories, :public, :boolean, :default => false
  end
end
