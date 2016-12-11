class Like < ActiveRecord::Base

  belongs_to :user

  belongs_to :word

  validates :user_id, :presence => true

  validates :user_id, :uniqueness => { :scope => [:word_id] }

  validates :word_id, :presence => true

end
