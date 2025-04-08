class Gig < ApplicationRecord
  belongs_to :series, optional: true
  
  validates :title, presence: true
  validates :date, presence: true
  
  # Image attachments for different sizes
  has_one_attached :main_image
  has_one_attached :thumbnail_image
  has_one_attached :banner_image
  
  # Scope for upcoming gigs
  scope :upcoming, -> { where('date >= ?', Date.today).order(date: :asc) }
  scope :past, -> { where('date < ?', Date.today).order(date: :desc) }
  
  # Generate a slug for the gig URL
  def generate_slug
    return unless title
    self.slug = title.parameterize
  end
  
  # Build the full ticket URL if it's a relative path
  def full_ticket_url
    return nil if ticket_url.blank?
    return ticket_url if ticket_url.start_with?('http://', 'https://')
    "https://thetin.net#{ticket_url.start_with?('/') ? ticket_url : "/#{ticket_url}"}"
  end
  
  # Format the time nicely
  def formatted_time
    return nil unless start_time
    "#{start_time.strftime('%l:%M%P')}#{end_time ? " - #{end_time.strftime('%l:%M%P')}" : ''}"
  end
  
  # Format the price for display
  def formatted_price
    return "Free" if price.blank? || price == 0
    "£#{sprintf('%.2f', price)}"
  end
end