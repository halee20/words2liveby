class Comment < ActiveRecord::Base

  belongs_to :word

  belongs_to :user

  validates :user_id, :presence => true

  validates :word_id, :presence => true

  validates :body, :presence => true

end
