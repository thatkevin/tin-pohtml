# Create an admin user
User.create!(
  email: 'admin@thetin.net',
  admin: true
)

# Create home page
Page.create!(
  title: 'Home',
  slug: 'home',
  content: '<h1>Welcome to The Tin Music and Arts</h1><p>We are dedicated to fostering a vibrant artistic community in Coventry. We host live music events featuring both international and local artists and offer diverse programs and activities in our venue at the Coal Vaults and other city locations.</p>',
  description: 'The Tin Music and Arts venue in Coventry',
  published: true,
  home: true
)

# Create an about page
Page.create!(
  title: 'About',
  slug: 'about',
  content: '<h1>About The Tin Music and Arts</h1><p>The Tin Music and Arts is dedicated to fostering a vibrant artistic community in Coventry. We host live music events featuring both international and local artists and offer diverse programs and activities in our venue at the Coal Vaults and other city locations.</p>',
  description: 'About The Tin Music and Arts venue in Coventry',
  published: true
)

# Create some example series
series = [
  {
    name: 'Kitchen Club Indie Disco',
    description: 'A monthly indie disco night featuring the best indie tracks from the 80s to today.'
  },
  {
    name: 'Sink or Swim',
    description: 'Showcasing the best up-and-coming artists from across the UK.'
  }
]

series.each do |series_data|
  Series.create!(series_data)
end

# Create some example gigs
kitchen_club = Series.find_by(name: 'Kitchen Club Indie Disco')
sink_or_swim = Series.find_by(name: 'Sink or Swim')

gigs = [
  {
    title: 'Charlie Parr',
    date: Date.today + 30.days,
    start_time: '19:30',
    headline: 'Sink or Swim presents',
    subheadline: 'The humble master of the 21st century folk tradition - Rolling Stone',
    description: 'Charlie Parr is an American country blues musician from Minnesota. He plays original and traditional folk and blues music, accompanying himself on guitar, dobro and banjo.',
    price: 12.00,
    ticket_url: '/tickets/charlie-parr',
    published: true,
    series: sink_or_swim
  },
  {
    title: 'Jeffrey Lewis & The Voltage',
    date: Date.today + 60.days,
    start_time: '19:30',
    headline: 'Songwriter and comic book artist',
    subheadline: 'Weird? Very… but also downright inspiring - Rolling Stone',
    description: 'Jeffrey Lewis is an American singer-songwriter and comic book artist. He mixes folk punk songs with illustrated stories and artworks.',
    price: 14.00,
    ticket_url: '/tickets/jeffrey-lewis',
    published: true
  },
  {
    title: 'Kitchen Club Indie Disco',
    date: Date.today + 45.days,
    start_time: '20:00',
    end_time: '01:00',
    headline: 'A proper shindig',
    description: 'Join us for a night of indie classics, new alternative hits and everything in between. Our resident DJs will keep you dancing all night long.',
    price: 5.00,
    ticket_url: '/tickets/kitchen-club',
    published: true,
    series: kitchen_club
  }
]

gigs.each do |gig_data|
  Gig.create!(gig_data)
end

puts "Seed data created successfully!"