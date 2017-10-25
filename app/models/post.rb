class Post < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :group, counter_cache: true
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :messages

  scope :recent, -> { order("updated_at DESC") }

  def editable_by?(user)
    user && user == author
  end
end
