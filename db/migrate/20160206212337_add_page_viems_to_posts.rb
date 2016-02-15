class AddPageViemsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :page_views, :integer, default: 0
  end
end
