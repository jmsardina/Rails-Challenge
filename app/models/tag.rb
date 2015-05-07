class Tag < ActiveRecord::Base
  before_save :create_short_name
  has_many :post_tags
  has_many :posts, through: :post_tags

  validates :name,  presence: true,
                    length: { in: 5..50 }

  def create_short_name
    self.short_name = name.parameterize
  end
end
