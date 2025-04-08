class Series < ApplicationRecord
  has_many :gigs, dependent: :nullify
  
  validates :name, presence: true, uniqueness: true
  
  has_one_attached :logo
  
  # Generate a slug for the series URL
  def generate_slug
    return unless name
    self.slug = name.parameterize
  end
  
  # Get the next upcoming gig in this series
  def next_gig
    gigs.upcoming.order(date: :asc).first
  end
  
  # Get all upcoming gigs in this series
  def upcoming_gigs
    gigs.upcoming.order(date: :asc)
  end
end