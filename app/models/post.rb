class Post < ActiveRecord::Base
  validates :content, :presence => true
  belongs_to :group
<<<<<<< cc2a665c416e6ffe59d7c3ef8589d26064847278
=======
  belongs_to :author, class_name: "User", foreign_key: :user_id

  def editable_by?(user)
    user && user == author
  end
>>>>>>> Implement post author identification mechanism
end
