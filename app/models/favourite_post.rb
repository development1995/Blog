class FavouritePost < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def self.manage(post)
    object = find_by(post: post)
    object ? object.destroy : create(post: post)
  end

end
