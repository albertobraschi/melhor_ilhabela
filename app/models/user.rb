class User < ActiveRecord::Base
  acts_as_authentic

  def self.search(search)
    if search
      find(:all, :conditions => ['username LIKE ?  OR email LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
end

