# The Tin Admin Panel

This is a Ruby on Rails application for managing gig content for The Tin Music and Arts venue website.

## Features

- Manage gigs with details like date, time, price, ticket links, and more
- Create and edit custom pages for the website
- Easy administration through a secure admin panel
- Authentication via magic email links
- Handle image uploads for gigs in various sizes

## Setup Instructions

1. Install Ruby and Rails dependencies:
   ```
   bundle install
   ```

2. Set up the database:
   ```
   rails db:create db:migrate db:seed
   ```

3. Start the server:
   ```
   rails server
   ```

4. Access the admin panel at `http://localhost:3000/admin`

## Models

- Gig: Stores information about performances/events
- Page: Custom website pages with editable content
- User: Admin users who can manage content
- Series: Collections of related gigs

## Authentication

This application uses magic links for authentication:
1. Enter email on login page
2. Receive a time-limited link via email
3. Click link to access the admin panel securely