# The Tin Admin Panel - Installation Guide

## Prerequisites

- Ruby 3.1.3 or higher
- SQLite3
- Node.js and Yarn (for asset compilation)
- Bundler

## Installation

1. Install Ruby gems:
```
cd app
bundle install
```

2. Set up the database:
```
rails db:create db:migrate db:seed
```

3. Start the Rails server:
```
rails server
```

4. Access the application:
   - Main website: http://localhost:3000
   - Admin panel: http://localhost:3000/admin
   - Login with: admin@thetin.net

## Features

### Admin Panel

The admin panel allows venue managers to:

- Manage gigs with comprehensive details:
  - Date and time information
  - Prices and ticket links
  - Descriptions and promotional text
  - Multiple image sizes (main, thumbnail, banner)
  - Series assignment

- Create and edit website pages:
  - Custom content
  - SEO fields
  - Custom URL slugs
  - Set a home page

- Organize gigs into series:
  - Recurring event series
  - Series descriptions and images

### Authentication

The application uses magic link authentication:

1. Enter email on login page
2. Receive a time-limited link via email
3. Click link to access the admin panel securely

### Image Management

Gigs can have three types of images:
- Main image: Used for the feature display on gig listing
- Thumbnail: Used in grid views
- Banner: Used for wide display at the top of gig details

## Development Notes

### Database Structure

- **Users**: Admin accounts with email-based authentication
- **Gigs**: Events with comprehensive metadata
- **Pages**: Editable website content pages
- **Series**: Collections of related gigs

### File Structure

The application follows standard Rails conventions:
- MVC architecture
- Tailwind CSS for styling
- Active Storage for image handling