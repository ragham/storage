class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :commenter, :body
  validates :commenter, :presence => true  
  validates :body, :presence => true,
                    :length => {:maximum =>25}

end

