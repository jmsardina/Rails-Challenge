class Post < ActiveRecord::Base
  belongs_to :author
  has_many :post_tags
  has_many :tags, through: :post_tags
  accepts_nested_attributes_for :tags

  validates :header,  presence: true,
                      length: { in: 5..50 }
  validates :body,    presence: true,
                      length: { in: 50..2500 }
  validates :author,  presence: true

  def time_posted
    "#{self.created_at.strftime("%B %d, %Y")} at #{self.created_at.time.strftime("%I:%M %P")}"
  end
end
