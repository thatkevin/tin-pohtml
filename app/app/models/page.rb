class Page < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  
  before_validation :generate_slug, if: -> { slug.blank? && title.present? }
  
  # Set the page to be the home page (only one can be home)
  def set_as_home
    if home
      Page.where.not(id: id).update_all(home: false)
    end
  end
  
  # Generate a slug for the page URL
  def generate_slug
    self.slug = title.parameterize
  end
  
  # Find a page by its slug
  def self.find_by_path(path)
    # Remove leading slash if present
    path = path[1..-1] if path.start_with?('/')
    # Get slug (first path component)
    slug = path.split('/').first || ''
    where(slug: slug).first
  end
  
  # Get the home page
  def self.home
    find_by(home: true) || first
  end
end